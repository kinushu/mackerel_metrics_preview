require 'json'

class McMt::HostMetricResult < ApplicationRecord
  def result_h
    JSON.parse(self.result.to_s) rescue {}
  end

  def result_array
    res_h = result_h
    return [] unless res_h.is_a?(Array)

    ret_arr = []
    res_h.each do |res|
      t = Time.at(res['time'].to_i)
      ret_arr << { time: t, value: res['value'] }
    end

    ret_arr
  end

  def x_time_y_value_array
    ret_arr = []
    result_array.each do |res|
      t = res[:time]
      ret_arr << { x: t.strftime('%Y-%m-%d %H:%M'), y: res[:value] }
    end

    ret_arr
  end
end
