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

ActiveRecord::Schema.define(version: 2019_08_03_122804) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.date "date"
    t.integer "dao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dao_id"], name: "index_articles_on_dao_id"
  end

  create_table "auditors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.string "url"
    t.date "date"
    t.integer "auditor_id"
    t.integer "dao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditor_id"], name: "index_audits_on_auditor_id"
    t.index ["dao_id"], name: "index_audits_on_dao_id"
  end

  create_table "blockchains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.integer "dao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dao_id"], name: "index_contracts_on_dao_id"
  end

  create_table "contributors", force: :cascade do |t|
    t.string "name"
    t.string "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors_daos", id: false, force: :cascade do |t|
    t.integer "contributor_id", null: false
    t.integer "dao_id", null: false
    t.index ["dao_id", "contributor_id"], name: "index_contributors_daos_on_dao_id_and_contributor_id"
  end

  create_table "daos", force: :cascade do |t|
    t.string "name"
    t.string "subtitle"
    t.text "description"
    t.string "website"
    t.string "contract_proof"
    t.string "mail"
    t.string "github"
    t.string "twitter"
    t.string "medium"
    t.string "telegram"
    t.string "reddit"
    t.string "discord"
    t.string "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status_id"
    t.integer "blockchain_id"
    t.integer "framework_id"
    t.text "assets_governed"
    t.string "decentralization_level"
    t.text "centralization_points"
    t.index ["blockchain_id"], name: "index_daos_on_blockchain_id"
    t.index ["framework_id"], name: "index_daos_on_framework_id"
    t.index ["status_id"], name: "index_daos_on_status_id"
  end

  create_table "daos_tags", id: false, force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "dao_id", null: false
    t.index ["dao_id", "tag_id"], name: "index_daos_tags_on_dao_id_and_tag_id"
    t.index ["tag_id", "dao_id"], name: "index_daos_tags_on_tag_id_and_dao_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "dao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dao_id"], name: "index_documents_on_dao_id"
  end

  create_table "frameworks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.date "date"
    t.integer "dao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dao_id"], name: "index_podcasts_on_dao_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
