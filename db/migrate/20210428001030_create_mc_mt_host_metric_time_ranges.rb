class CreateMcMtHostMetricTimeRanges < ActiveRecord::Migration[6.1]
  def change
    create_table :mc_mt_host_metric_time_ranges do |t|
      t.integer :host_id
      t.datetime :from_at
      t.datetime :to_at

      t.timestamps
    end
  end
end
