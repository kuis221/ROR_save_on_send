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

ActiveRecord::Schema.define(version: 20141106142613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "countries", force: true do |t|
    t.string "name"
    t.string "currency_code", limit: 3
  end

  create_table "payment_methods", force: true do |t|
    t.string "name"
  end

  create_table "service_providers", force: true do |t|
    t.string "name"
  end

  add_index "service_providers", ["name"], name: "index_service_providers_on_name", using: :btree

  create_table "user_recent_transactions", force: true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.integer  "amount_sent_cents",                             default: 0, null: false
    t.integer  "amount_received_cents",                         default: 0, null: false
    t.integer  "originating_source_of_funds_id"
    t.integer  "service_provider_id"
    t.integer  "destination_preference_for_funds_id"
    t.string   "fees_for_sending"
    t.string   "fees_for_receiving"
    t.integer  "send_to_receive_duration"
    t.string   "documentation_requirements"
    t.string   "promotion"
    t.integer  "service_quality"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",                            limit: 3
  end

  create_table "users", force: true do |t|
    t.string   "email",                         default: "", null: false
    t.string   "encrypted_password",            default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",               default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zipcode"
    t.integer  "money_transfer_destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
