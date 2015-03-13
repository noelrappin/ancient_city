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

ActiveRecord::Schema.define(version: 20150313194555) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trip_id"
    t.string   "name"
    t.text     "description"
    t.integer  "price_cents"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities", ["trip_id"], name: "index_activities_on_trip_id"

  create_table "coupon_codes", force: :cascade do |t|
    t.integer  "discount_percentage"
    t.string   "applies_to"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", force: :cascade do |t|
    t.integer  "trip_id"
    t.string   "name"
    t.text     "description"
    t.integer  "price_cents"
    t.string   "remote_api_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "hotels", ["trip_id"], name: "index_hotels_on_trip_id"

  create_table "order_line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "buyable_id"
    t.string   "buyable_type"
    t.integer  "amount"
    t.decimal  "unit_price",     precision: 10, scale: 2
    t.decimal  "extended_price", precision: 10, scale: 2
    t.decimal  "processing_fee", precision: 10, scale: 2
    t.decimal  "price_paid",     precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promo_code_id"
    t.decimal  "discount",       precision: 10, scale: 2
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total_price_paid", precision: 10, scale: 2
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "image_name"
    t.string   "tag_line"
    t.integer  "price_cents"
    t.string   "location"
    t.string   "tag"
    t.integer  "capacity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "home_year"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
