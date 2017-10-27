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

ActiveRecord::Schema.define(version: 20171027111257) do

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

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
