require 'json'

class McMt::Host < ApplicationRecord
  has_many :metric_time_ranges, class_name: 'McMt::HostMetricTimeRange', foreign_key: :host_id

  def display_name
    "#{metadata_h['name']}(#{metadata_h['id']})"
  end

  def metadata_h
    JSON.parse(metadata_json.to_s) rescue {}
  end

  def metric_names
    JSON.parse(metric_names_json.to_s) rescue []
  end
end
