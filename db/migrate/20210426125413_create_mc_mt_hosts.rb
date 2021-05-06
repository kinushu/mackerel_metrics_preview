class CreateMcMtHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :mc_mt_hosts do |t|
      t.string :host_id
      t.text :metadata_json
      t.text :metric_names_json

      t.timestamps
    end
  end
end
