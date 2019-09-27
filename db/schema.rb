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

ActiveRecord::Schema.define(version: 2019_09_27_125942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.bigint "option_id"
    t.string "ral"
    t.integer "price_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_colors_on_option_id"
  end

  create_table "dimension_names", force: :cascade do |t|
    t.bigint "option_id"
    t.string "dimension_1_name"
    t.string "dimension_2_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_dimension_names_on_option_id"
  end

  create_table "final_client_relations", force: :cascade do |t|
    t.bigint "relation_id"
    t.bigint "final_client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["final_client_id"], name: "index_final_client_relations_on_final_client_id"
    t.index ["relation_id"], name: "index_final_client_relations_on_relation_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "option_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_options_on_product_id"
  end

  create_table "price_lists", force: :cascade do |t|
    t.bigint "option_id"
    t.integer "dimension_1"
    t.integer "dimension_2"
    t.integer "price_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_price_lists_on_option_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "third_party_id"
    t.integer "category"
    t.float "basic_coef"
    t.string "name"
    t.index ["third_party_id"], name: "index_products_on_third_party_id"
  end

  create_table "quote_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "color_id"
    t.bigint "price_list_id"
    t.index ["color_id"], name: "index_quote_products_on_color_id"
    t.index ["price_list_id"], name: "index_quote_products_on_price_list_id"
    t.index ["product_id"], name: "index_quote_products_on_product_id"
    t.index ["quote_id"], name: "index_quote_products_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "references"
    t.integer "state"
    t.date "state_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.bigint "final_client_relation_id"
    t.index ["final_client_relation_id"], name: "index_quotes_on_final_client_relation_id"
  end

  create_table "relation_coefs", force: :cascade do |t|
    t.bigint "relation_id"
    t.bigint "product_id"
    t.float "coef"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_relation_coefs_on_product_id"
    t.index ["relation_id"], name: "index_relation_coefs_on_relation_id"
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

  create_table "variables", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_variables_on_token", unique: true
  end

  add_foreign_key "colors", "options"
  add_foreign_key "dimension_names", "options"
  add_foreign_key "final_client_relations", "relations"
  add_foreign_key "final_client_relations", "third_parties", column: "final_client_id"
  add_foreign_key "options", "products"
  add_foreign_key "price_lists", "options"
  add_foreign_key "products", "third_parties"
  add_foreign_key "quote_products", "colors"
  add_foreign_key "quote_products", "price_lists"
  add_foreign_key "quote_products", "products"
  add_foreign_key "quote_products", "quotes"
  add_foreign_key "quotes", "final_client_relations"
  add_foreign_key "relation_coefs", "products"
  add_foreign_key "relation_coefs", "relations"
  add_foreign_key "relations", "third_parties", column: "client_id"
  add_foreign_key "relations", "third_parties", column: "manufacturer_id"
  add_foreign_key "users", "third_parties"
end
