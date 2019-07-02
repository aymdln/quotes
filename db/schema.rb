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

ActiveRecord::Schema.define(version: 2019_07_02_130611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.bigint "third_party_id"
    t.integer "category"
    t.float "basic_coef"
    t.string "name"
    t.index ["third_party_id"], name: "index_products_on_third_party_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "value"
    t.string "ref"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_properties_on_product_id"
  end

  create_table "quote_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "quote_id"
    t.index ["product_id"], name: "index_quote_products_on_product_id"
    t.index ["quote_id"], name: "index_quote_products_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.bigint "relation_id"
    t.bigint "final_client_id"
    t.string "references"
    t.integer "state"
    t.date "state_date"
    t.index ["final_client_id"], name: "index_quotes_on_final_client_id"
    t.index ["relation_id"], name: "index_quotes_on_relation_id"
  end

  create_table "relation_product_coefs", force: :cascade do |t|
    t.bigint "relation_id"
    t.bigint "product_id"
    t.float "coef"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_relation_product_coefs_on_product_id"
    t.index ["relation_id"], name: "index_relation_product_coefs_on_relation_id"
  end

  create_table "relations", force: :cascade do |t|
    t.bigint "manufacturer_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_relations_on_client_id"
    t.index ["manufacturer_id"], name: "index_relations_on_manufacturer_id"
  end

  create_table "third_parties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "country"
    t.string "email"
    t.string "web"
    t.string "tva"
    t.string "siret"
    t.string "siren"
    t.string "phone"
    t.integer "third_party_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "third_party_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["third_party_id"], name: "index_users_on_third_party_id"
  end

  add_foreign_key "products", "third_parties"
  add_foreign_key "properties", "products"
  add_foreign_key "quote_products", "products"
  add_foreign_key "quote_products", "quotes"
  add_foreign_key "quotes", "relations"
  add_foreign_key "quotes", "third_parties", column: "final_client_id"
  add_foreign_key "relation_product_coefs", "products"
  add_foreign_key "relation_product_coefs", "relations"
  add_foreign_key "relations", "third_parties", column: "client_id"
  add_foreign_key "relations", "third_parties", column: "manufacturer_id"
  add_foreign_key "users", "third_parties"
end
