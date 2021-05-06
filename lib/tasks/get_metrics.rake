require 'pp'
require 'mackerel/client'
require 'json'

def create_mackerel_host_info(mk_cli, host_id, target_st_time, target_ed_time)
  host_record = McMt::Host.find_by(host_id: host_id)
  if host_record.nil?
    host = mk_cli.get_host(host_id)
    if host.blank?
      raise 'not found host'
    end

    m_names_h = mk_cli.get_host_metric_names(host_id)

    p 'host save'
    meta_h = host.to_h
    host_record = McMt::Host.create!(host_id: host_id, metadata_json: meta_h.to_json, metric_names_json: m_names_h.to_json)
  end

  # pp @mackerel.get_host_metric_names(host_record.host_id)
  # metric_name = 'custom.alb.httpcode_count.target_2xx'
  res_attr = {
    host_id: host_record.id,
    from_at: target_st_time, to_at: target_ed_time
  }

  tr_record = McMt::HostMetricTimeRange.find_by(res_attr)
  if tr_record.nil?
    p 'tr save'
    tr_record = McMt::HostMetricTimeRange.create!(res_attr)
  end

  metric_names = host_record.metric_names # .first(10)
  metric_names.each do |metric_name|
    res_attr = {
      time_range_id: tr_record.id, metric_name: metric_name
    }
    res_record = McMt::HostMetricResult.find_by(res_attr)
    next unless res_record.nil?

    p "res save #{metric_name}"
    res_h = mk_cli.get_host_metrics(host_record.host_id, metric_name,
                                    target_st_time.to_i, target_ed_time.to_i)
    res_record = McMt::HostMetricResult.new(res_attr)
    res_record.update!(result: res_h.to_json)
    p res_record.result.to_s.first(100)
  end
end

def target_time_envs_to_arr
  time_arrs = []
  (1..10).each do |i|
    env_sym = "TARGET_TIME_RANGE_#{i}"
    t_s = ENV[env_sym].to_s
    break if t_s.blank?

    ts_arr = ENV[env_sym].to_s.split(',').map(&:strip)
    break if ts_arr.size != 2

    time_arr = ts_arr.map { |s| Time.zone.parse(s) }
    time_arrs << { start: time_arr[0], end: time_arr[1] }
  end

  time_arrs
end

namespace :mk do
  desc 'get_service_metrics'
  task service_metrics: :environment do
    target_times = target_time_envs_to_arr

    mk_cli = Mackerel::Client.new(mackerel_api_key: ENV['MACKEREL_APIKEY'])

    s_name = ENV['TARGET_SERVICE_NAME']
    hosts = mk_cli.get_hosts(service: s_name)

    target_times.each do |target_time_info|
      p target_st_time = target_time_info[:start]
      p target_ed_time = target_time_info[:end]

      hosts.each do |host|
        p host.id
        create_mackerel_host_info(mk_cli, host.id, target_st_time, target_ed_time)
      end
    end
  end

  desc 'get_host_metrics'
  task host_metrics: :environment do
    target_times = target_time_envs_to_arr

    mk_cli = Mackerel::Client.new(mackerel_api_key: ENV['MACKEREL_APIKEY'])

    p host_id = ENV['TARGET_HOST_ID']
    target_times.each do |target_time_info|
      p target_st_time = target_time_info[:start]
      p target_ed_time = target_time_info[:end]
      create_mackerel_host_info(mk_cli, host_id, target_st_time, target_ed_time)
    end
  end
end
