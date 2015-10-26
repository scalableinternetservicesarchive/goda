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

ActiveRecord::Schema.define(version: 20151026000822) do

  create_table "drivers", force: :cascade do |t|
    t.string   "departure"
    t.string   "destination"
    t.decimal  "price"
    t.string   "depart_time"
    t.string   "estimated_arrival_time"
    t.text     "description"
    t.string   "car_type"
    t.integer  "passenger_num"
    t.string   "contact_info"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "userid"
    t.integer  "user_id"
    t.integer  "left"
  end

  add_index "drivers", ["user_id"], name: "index_drivers_on_user_id"

  create_table "hitchers", force: :cascade do |t|
    t.string   "departure"
    t.string   "destination"
    t.string   "depart_time"
    t.string   "arrival_time"
    t.text     "description"
    t.integer  "num"
    t.string   "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "hitchers", ["user_id"], name: "index_hitchers_on_user_id"

  create_table "rides", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "password_digest"
  end

end
