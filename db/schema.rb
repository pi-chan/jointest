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

ActiveRecord::Schema.define(version: 20131106080102) do

  create_table "entries", force: true do |t|
    t.string   "title",        default: ""
    t.text     "content"
    t.datetime "published_at",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["published_at"], name: "index_entries_on_published_at", using: :btree

  create_table "relationships", force: true do |t|
    t.integer "user_id",                  null: false
    t.integer "entry_id",                 null: false
    t.boolean "starred",  default: false
  end

  add_index "relationships", ["entry_id"], name: "index_relationships_on_entry_id", using: :btree
  add_index "relationships", ["user_id", "entry_id"], name: "index_relationships_on_user_id_and_entry_id", unique: true, using: :btree
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
