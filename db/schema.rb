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

ActiveRecord::Schema.define(version: 20150305104606) do

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

  create_table "feedbacks", force: true do |t|
    t.string   "comments",         limit: 512
    t.integer  "service_quality"
    t.integer  "user_id"
    t.integer  "commendable_id"
    t.string   "commendable_type"
    t.boolean  "approved",                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fx_rates", force: true do |t|
    t.string   "text",       limit: 16384
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "payment_methods", force: true do |t|
    t.string "name"
    t.string "slug", null: false
  end

  create_table "referrals", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments"
  end

  create_table "remittance_terms", force: true do |t|
    t.integer "receive_country_id"
    t.integer "service_provider_id"
    t.integer "send_method_id"
    t.integer "receive_method_id"
    t.string  "receive_currency",         limit: 3
    t.float   "send_amount_range_from"
    t.float   "send_amount_range_to"
    t.integer "fees_for_sending_cents",             default: 0,   null: false
    t.float   "fees_for_sending_percent",           default: 0.0
    t.float   "fx_markup"
    t.string  "duration"
    t.text    "documentation"
    t.string  "promotions"
    t.integer "service_quality"
  end

  create_table "service_providers", force: true do |t|
    t.string  "name"
    t.string  "landing_page",    limit: 512
    t.string  "slug"
    t.integer "created_by_id"
    t.string  "created_by_type"
  end

  add_index "service_providers", ["name"], name: "index_service_providers_on_name", using: :btree
  add_index "service_providers", ["slug"], name: "index_service_providers_on_slug", using: :btree

  create_table "user_input_errors", force: true do |t|
    t.integer "user_id"
    t.string  "location"
    t.string  "messages", limit: 2048
  end

  create_table "user_levels", force: true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "user_next_transfers", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount_send_cents",                             default: 0, null: false
    t.integer  "amount_receive_cents",                          default: 0, null: false
    t.string   "receive_currency",                    limit: 3
    t.integer  "originating_source_of_funds_id"
    t.integer  "destination_preference_for_funds_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "money_transfer_destination_id"
  end

  create_table "user_recent_transactions", force: true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.integer  "amount_sent_cents",                             default: 0, null: false
    t.integer  "amount_received_cents",                         default: 0, null: false
    t.integer  "originating_source_of_funds_id"
    t.integer  "service_provider_id"
    t.integer  "destination_preference_for_funds_id"
    t.string   "fees_for_receiving"
    t.integer  "send_to_receive_duration"
    t.string   "documentation_requirements"
    t.string   "promotion"
    t.integer  "service_quality"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency",                            limit: 3
    t.integer  "fees_for_sending_cents",                        default: 0, null: false
    t.integer  "money_transfer_destination_id"
    t.string   "send_to_receive_duration_interval"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                      default: "", null: false
    t.string   "encrypted_password",                         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                            default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zipcode"
    t.integer  "money_transfer_destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "phone"
    t.boolean  "accept_terms"
    t.boolean  "accept_emails"
    t.integer  "level_id"
    t.integer  "points",                                     default: 0
    t.string   "about_me",                      limit: 1024
    t.string   "avatar"
  end

  add_index "users", ["email", "phone"], name: "index_users_on_email_and_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
