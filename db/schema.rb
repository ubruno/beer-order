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

ActiveRecord::Schema.define(version: 20150707230243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string   "name",                 limit: 50,              null: false
    t.string   "description",          limit: 250,             null: false
    t.string   "style",                limit: 30,              null: false
    t.string   "bootle_size",          limit: 20,              null: false
    t.binary   "label"
    t.float    "price",                                        null: false
    t.integer  "maximum_order_amount"
    t.integer  "available_quantity",               default: 0, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "customer_name",    limit: 50,  null: false
    t.string   "email",            limit: 100
    t.string   "phone_number",     limit: 20
    t.string   "delivery_address", limit: 200, null: false
    t.integer  "quantity"
    t.string   "status",           limit: 10
    t.datetime "created_at",                   null: false
    t.integer  "beer_id"
    t.datetime "updated_at",                   null: false
  end

  add_index "orders", ["beer_id"], name: "index_orders_on_beer_id", using: :btree

  add_foreign_key "orders", "beers"
end
