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

ActiveRecord::Schema.define(version: 2021_05_03_002606) do

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.text "caption"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salon_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "menu_id"
    t.string "salon_name"
    t.string "salon_image_id"
    t.string "postal_code"
    t.string "prefecture"
    t.string "address_city"
    t.string "address_building"
    t.string "phone"
    t.text "introduction"
    t.string "business_day"
    t.time "business_start_time"
    t.time "business_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_salon_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_salon_users_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "family_name"
    t.string "first_name"
    t.string "family_name_kana"
    t.string "first_name_kana"
    t.string "nickname"
    t.string "postal_code"
    t.string "prefecture"
    t.string "address_city"
    t.string "address_building"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
