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

ActiveRecord::Schema.define(version: 20150420161516) do

  create_table "blasts", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.integer  "to"
  end

  create_table "human_logins", force: true do |t|
    t.string   "user_agent"
    t.string   "ip"
    t.integer  "human_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "humans", force: true do |t|
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
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "fullname"
    t.string   "gender"
    t.string   "agerange"
    t.string   "location"
    t.string   "picture"
  end

  add_index "humans", ["email"], name: "index_humans_on_email", unique: true
  add_index "humans", ["reset_password_token"], name: "index_humans_on_reset_password_token", unique: true

  create_table "schedules", force: true do |t|
    t.integer  "mode"
    t.integer  "value"
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
  end

  create_table "templates", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "backgroundurl"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logourl"
  end

  create_table "users", force: true do |t|
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
    t.string   "businessname"
    t.string   "businesscategory"
    t.string   "loginpage"
    t.string   "welcomepage"
    t.string   "logourl"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "region"
    t.string   "postcode"
    t.string   "country"
    t.boolean  "receivenewsletters"
    t.string   "mobile"
    t.string   "bghex"
    t.string   "mailer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
