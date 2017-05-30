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

ActiveRecord::Schema.define(version: 20170529123957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.integer  "number",            default: 0
    t.string   "state",             default: "new"
    t.string   "priority",          default: "minor"
    t.text     "comment",           default: ""
    t.integer  "device_id",         default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "registered_app_id", default: 0
  end

  add_index "bugs", ["device_id"], name: "index_bugs_on_device_id", using: :btree
  add_index "bugs", ["registered_app_id"], name: "index_bugs_on_registered_app_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "os"
    t.integer  "memory",     default: 0
    t.integer  "storage",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "registered_apps", force: :cascade do |t|
    t.string   "token"
    t.integer  "serial",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
