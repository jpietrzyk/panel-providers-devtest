# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171025145516) do

  create_table "countries", force: :cascade do |t|
    t.string   "country_code",      limit: 2, null: false
    t.integer  "panel_provider_id",           null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "countries", ["panel_provider_id"], name: "index_countries_on_panel_provider_id"

  create_table "countries_target_groups", id: false, force: :cascade do |t|
    t.integer "country_id",      null: false
    t.integer "target_group_id", null: false
  end

  add_index "countries_target_groups", ["country_id", "target_group_id"], name: "c_id_tg_id"
  add_index "countries_target_groups", ["target_group_id", "country_id"], name: "tg_id_c_id"

  create_table "location_groups", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "country_id",        null: false
    t.integer  "panel_provider_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "location_groups", ["country_id"], name: "index_location_groups_on_country_id"
  add_index "location_groups", ["panel_provider_id"], name: "index_location_groups_on_panel_provider_id"

  create_table "location_groups_locations", id: false, force: :cascade do |t|
    t.integer "location_id",       null: false
    t.integer "location_group_id", null: false
  end

  add_index "location_groups_locations", ["location_group_id", "location_id"], name: "lg_id_l_id"
  add_index "location_groups_locations", ["location_id", "location_group_id"], name: "l_id_lg_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "external_id"
    t.string   "secret_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "panel_providers", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_groups", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "external_id"
    t.integer  "parent_id"
    t.string   "secret_code"
    t.integer  "panel_provider_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "target_groups", ["panel_provider_id"], name: "index_target_groups_on_panel_provider_id"

end
