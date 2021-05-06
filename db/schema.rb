# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_28_001030) do

  create_table "mc_mt_host_metric_results", charset: "utf8mb4", force: :cascade do |t|
    t.integer "time_range_id"
    t.string "metric_name"
    t.text "result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mc_mt_host_metric_time_ranges", charset: "utf8mb4", force: :cascade do |t|
    t.integer "host_id"
    t.datetime "from_at"
    t.datetime "to_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mc_mt_hosts", charset: "utf8mb4", force: :cascade do |t|
    t.string "host_id"
    t.text "metadata_json"
    t.text "metric_names_json"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
