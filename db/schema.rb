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

ActiveRecord::Schema.define(version: 20140913163857) do

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_documents", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "document_id"
  end

  create_table "contributors", force: true do |t|
    t.string   "contributor_name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributors_documents", id: false, force: true do |t|
    t.integer "contributor_id"
    t.integer "document_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "documents", force: true do |t|
    t.string   "document_name"
    t.integer  "document_year"
    t.integer  "term"
    t.integer  "grade"
    t.string   "document_location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_uid"
    t.string   "file_name"
    t.string   "file"
  end

  create_table "documents_formats", id: false, force: true do |t|
    t.integer "document_id"
    t.integer "format_id"
  end

  create_table "documents_schools", id: false, force: true do |t|
    t.integer "school_id"
    t.integer "document_id"
  end

  create_table "documents_subjects", id: false, force: true do |t|
    t.integer "document_id"
    t.integer "subject_id"
  end

  create_table "formats", force: true do |t|
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "english_school"
    t.string   "chinese_school"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
