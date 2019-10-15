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

ActiveRecord::Schema.define(version: 2019_10_15_100830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "color_propreties_dependants", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "option_color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_color_id"], name: "index_color_propreties_dependants_on_option_color_id"
    t.index ["property_id"], name: "index_color_propreties_dependants_on_property_id"
  end

  create_table "final_client_relations", force: :cascade do |t|
    t.bigint "relation_id"
    t.bigint "final_client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["final_client_id"], name: "index_final_client_relations_on_final_client_id"
    t.index ["relation_id"], name: "index_final_client_relations_on_relation_id"
  end

  create_table "glazing_propreties_dependants", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "option_glazing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_glazing_id"], name: "index_glazing_propreties_dependants_on_option_glazing_id"
    t.index ["property_id"], name: "index_glazing_propreties_dependants_on_property_id"
  end

  create_table "option_colors", force: :cascade do |t|
    t.bigint "option_id"
    t.string "name"
    t.integer "type_color"
    t.string "value_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "increase_id"
    t.boolean "included"
    t.index ["increase_id"], name: "index_option_colors_on_increase_id"
    t.index ["option_id"], name: "index_option_colors_on_option_id"
  end

  create_table "option_dimensions", force: :cascade do |t|
    t.bigint "option_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dimension_id"
    t.index ["dimension_id"], name: "index_option_dimensions_on_dimension_id"
    t.index ["option_id"], name: "index_option_dimensions_on_option_id"
  end

  create_table "option_glazings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "increase_id"
    t.bigint "option_id"
    t.boolean "included"
    t.index ["increase_id"], name: "index_option_glazings_on_increase_id"
    t.index ["option_id"], name: "index_option_glazings_on_option_id"
  end

  create_table "option_results", force: :cascade do |t|
    t.bigint "option_id"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_option_results_on_option_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "option_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "third_party_id"
    t.integer "category"
    t.float "basic_coef"
    t.string "name"
    t.text "description"
    t.index ["third_party_id"], name: "index_products_on_third_party_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "ref"
    t.string "description"
    t.bigint "conso_id"
    t.bigint "packing_id"
    t.bigint "quantity_id"
    t.bigint "order_id"
    t.integer "price_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conso_id"], name: "index_properties_on_conso_id"
    t.index ["order_id"], name: "index_properties_on_order_id"
    t.index ["packing_id"], name: "index_properties_on_packing_id"
    t.index ["quantity_id"], name: "index_properties_on_quantity_id"
  end

  create_table "quote_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "option_result_id"
    t.index ["option_result_id"], name: "index_quote_products_on_option_result_id"
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

  create_table "sections", force: :cascade do |t|
    t.bigint "option_id"
    t.bigint "option_dimension_id"
    t.bigint "max_id"
    t.bigint "calcul_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calcul_id"], name: "index_sections_on_calcul_id"
    t.index ["max_id"], name: "index_sections_on_max_id"
    t.index ["option_dimension_id"], name: "index_sections_on_option_dimension_id"
    t.index ["option_id"], name: "index_sections_on_option_id"
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
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variables_on_product_id"
    t.index ["token"], name: "index_variables_on_token", unique: true
  end

  add_foreign_key "color_propreties_dependants", "option_colors"
  add_foreign_key "color_propreties_dependants", "properties"
  add_foreign_key "final_client_relations", "relations"
  add_foreign_key "final_client_relations", "third_parties", column: "final_client_id"
  add_foreign_key "glazing_propreties_dependants", "option_glazings"
  add_foreign_key "glazing_propreties_dependants", "properties"
  add_foreign_key "option_colors", "options"
  add_foreign_key "option_colors", "variables", column: "increase_id"
  add_foreign_key "option_dimensions", "options"
  add_foreign_key "option_dimensions", "variables", column: "dimension_id"
  add_foreign_key "option_glazings", "options"
  add_foreign_key "option_glazings", "variables", column: "increase_id"
  add_foreign_key "option_results", "options"
  add_foreign_key "options", "products"
  add_foreign_key "products", "third_parties"
  add_foreign_key "properties", "variables", column: "conso_id"
  add_foreign_key "properties", "variables", column: "order_id"
  add_foreign_key "properties", "variables", column: "packing_id"
  add_foreign_key "properties", "variables", column: "quantity_id"
  add_foreign_key "quote_products", "option_results"
  add_foreign_key "quote_products", "products"
  add_foreign_key "quote_products", "quotes"
  add_foreign_key "quotes", "final_client_relations"
  add_foreign_key "relation_coefs", "products"
  add_foreign_key "relation_coefs", "relations"
  add_foreign_key "relations", "third_parties", column: "client_id"
  add_foreign_key "relations", "third_parties", column: "manufacturer_id"
  add_foreign_key "sections", "option_dimensions"
  add_foreign_key "sections", "options"
  add_foreign_key "sections", "variables", column: "calcul_id"
  add_foreign_key "sections", "variables", column: "max_id"
  add_foreign_key "users", "third_parties"
end
