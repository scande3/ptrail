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

ActiveRecord::Schema.define(version: 2018_05_29_190126) do

  create_table "doc_files", force: :cascade do |t|
    t.integer "doc_id"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doc_id"], name: "index_doc_files_on_doc_id"
  end

  create_table "doc_subjects", force: :cascade do |t|
    t.integer "doc_id"
    t.integer "subject_id"
    t.index ["doc_id", "subject_id"], name: "index_doc_to_subjects", unique: true
    t.index ["doc_id"], name: "index_doc_subjects_on_doc_id"
    t.index ["subject_id"], name: "index_doc_subjects_on_subject_id"
  end

  create_table "docs", force: :cascade do |t|
    t.string "title", limit: 355
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "label"
    t.index ["label"], name: "index_subjects_on_label", unique: true
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
