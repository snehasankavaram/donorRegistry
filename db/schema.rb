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

ActiveRecord::Schema.define(version: 20160314021738) do

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
  end

  create_table "pledges", force: true do |t|
    t.string   "item_name"
    t.string   "quantity"
    t.boolean  "fulfilled"
    t.datetime "delivery_date"
    t.boolean  "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
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
