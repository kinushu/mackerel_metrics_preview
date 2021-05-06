class McMt::HostMetricTimeRange < ApplicationRecord
  belongs_to :host, class_name: 'McMt::Host', foreign_key: :host_id
  has_many :metric_time_ranges, class_name: 'McMt::HostMetricTimeRange', foreign_key: :host_id

  has_many :results, class_name: 'McMt::HostMetricResult', foreign_key: :time_range_id
end
