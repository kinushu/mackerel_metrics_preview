class CreateMcMtHostMetricResults < ActiveRecord::Migration[6.1]
  def change
    create_table :mc_mt_host_metric_results do |t|
      t.integer :time_range_id
      t.string :metric_name
      t.text :result

      t.timestamps
    end
  end
end
