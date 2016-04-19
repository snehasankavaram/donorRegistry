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

ActiveRecord::Schema.define(version: 20160416101005) do

  create_table "drives", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.float    "lat"
    t.float    "lon"
    t.string   "address"
    t.string   "name"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_line_2"
    t.string   "phone_number"
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.string   "link"
    t.time     "sun_open"
    t.time     "sun_close"
    t.time     "mon_open"
    t.time     "mon_close"
    t.time     "tues_open"
    t.time     "tues_close"
    t.time     "wed_open"
    t.time     "wed_close"
    t.time     "thurs_open"
    t.time     "thurs_close"
    t.time     "fri_open"
    t.time     "fri_close"
    t.time     "sat_open"
    t.time     "sat_close"
    t.integer  "drive_id"
  end

  add_index "organizations", ["drive_id"], name: "index_organizations_on_drive_id"

  create_table "pledges", force: true do |t|
    t.string   "item_name"
    t.string   "quantity"
    t.boolean  "fulfilled"
    t.datetime "delivery_date"
    t.boolean  "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "org_id"
    t.integer  "registry_item_id"
    t.boolean  "item_deleted"
  end

  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id"

  create_table "registry_items", force: true do |t|
    t.string   "name"
    t.integer  "amount_needed"
    t.integer  "amount_pledged"
    t.integer  "amount_received"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registry_items", ["organization_id"], name: "index_registry_items_on_organization_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "phone_number"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.float    "lat"
    t.float    "lon"
    t.string   "password_digest"
  end

end
