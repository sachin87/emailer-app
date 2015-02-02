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

ActiveRecord::Schema.define(version: 20150202054402) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email"

  create_table "message_contacts", force: true do |t|
    t.integer  "receiver_id"
    t.integer  "message_id"
    t.boolean  "delivered",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_contacts", ["receiver_id", "message_id", "delivered"], name: "combine_index"

  create_table "messages", force: true do |t|
    t.datetime "schedule_date"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processed",     default: false
    t.boolean  "enqueued",      default: false
  end

  add_index "messages", ["enqueued"], name: "index_messages_on_enqueued"
  add_index "messages", ["processed"], name: "index_messages_on_processed"
  add_index "messages", ["schedule_date"], name: "index_messages_on_schedule_date"

end
