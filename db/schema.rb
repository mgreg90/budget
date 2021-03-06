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

ActiveRecord::Schema.define(version: 20170703062653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "primary",                  default: false
    t.integer  "initial_balance_in_cents", default: 0
    t.datetime "initial_balance_time"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "issuer_id"
    t.index ["issuer_id"], name: "index_accounts_on_issuer_id", using: :btree
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_cards_on_account_id", using: :btree
  end

  create_table "issuer_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issuers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "issuer_type_id"
    t.index ["issuer_type_id"], name: "index_issuers_on_issuer_type_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "price_in_cents"
    t.string   "item_name"
    t.string   "vendor"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["card_id"], name: "index_transactions_on_card_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "nickname"
  end

  add_foreign_key "accounts", "issuers"
  add_foreign_key "accounts", "users"
  add_foreign_key "cards", "accounts"
  add_foreign_key "issuers", "issuer_types"
  add_foreign_key "transactions", "cards"
end
