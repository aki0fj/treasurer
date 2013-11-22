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

ActiveRecord::Schema.define(version: 20130810070710) do

  create_table "account_types", force: true do |t|
    t.string   "type_cd"
    t.string   "type_name_en"
    t.string   "type_name_ja"
    t.string   "account_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "bs"
    t.boolean  "pl"
  end

  create_table "accounts", force: true do |t|
    t.string   "acc_cd"
    t.string   "acc_name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "acc_name_ja"
    t.integer  "account_type_id"
  end

  add_index "accounts", ["acc_cd", "acc_name_en"], name: "index_accounts_on_acc_cd_and_acc_name_en", unique: true

  create_table "journal_credits", force: true do |t|
    t.integer  "journal_debit_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journal_debits", force: true do |t|
    t.date     "occur_on"
    t.integer  "account_id"
    t.decimal  "amount",      precision: 17, scale: 2, default: 0.0
    t.string   "description"
    t.integer  "p_r"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
