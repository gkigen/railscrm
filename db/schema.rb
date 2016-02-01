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

ActiveRecord::Schema.define(version: 20160201061619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "company"
    t.string   "address"
    t.string   "email"
    t.integer  "mobile"
    t.string   "industry"
    t.string   "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string   "company"
    t.string   "state"
    t.string   "status"
    t.string   "handledby"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "company"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "email"
    t.integer  "mobile"
    t.string   "industry"
    t.string   "leadsource"
    t.string   "county"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "invoiceno"
    t.integer  "ammount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: :cascade do |t|
    t.string   "company"
    t.string   "address"
    t.string   "email"
    t.integer  "mobile"
    t.string   "industry"
    t.string   "county"
    t.string   "leadsource"
    t.string   "converted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string   "name"
    t.string   "account"
    t.string   "salesstage"
    t.integer  "leadsource"
    t.string   "nextstep"
    t.string   "ammount"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
