# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_22_111551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "accountable_type", null: false
    t.bigint "accountable_id", null: false
    t.string "type"
    t.string "name"
    t.string "contacts"
    t.text "memo"
    t.boolean "active", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "alias"
    t.string "cost_code"
    t.string "barcode"
    t.string "system_code"
    t.bigint "product_id", null: false
    t.string "codable_type", null: false
    t.bigint "codable_id", null: false
    t.boolean "active"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["codable_type", "codable_id"], name: "index_codes_on_codable"
    t.index ["product_id"], name: "index_codes_on_product_id"
    t.index ["user_id"], name: "index_codes_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "type"
    t.string "ancestry"
    t.string "category"
    t.boolean "income"
    t.boolean "direct_expense"
    t.boolean "indirect_expense"
    t.boolean "administrative_cost"
    t.boolean "active", default: true
    t.integer "organization_id"
    t.string "organizable_type", null: false
    t.bigint "organizable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organizable_type", "organizable_id"], name: "index_organizations_on_organizable"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "priceable_type", null: false
    t.bigint "priceable_id", null: false
    t.string "type"
    t.bigint "code_id", null: false
    t.float "amount", default: 0.0
    t.boolean "active", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code_id"], name: "index_prices_on_code_id"
    t.index ["priceable_type", "priceable_id"], name: "index_prices_on_priceable"
    t.index ["user_id"], name: "index_prices_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "desc"
    t.string "type"
    t.string "category"
    t.string "ancestry"
    t.boolean "durable"
    t.string "durability"
    t.boolean "convenient"
    t.boolean "resaleable"
    t.boolean "industrial"
    t.boolean "internal_trade"
    t.boolean "active"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry"], name: "index_products_on_ancestry"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "type"
    t.string "ancestry"
    t.string "category"
    t.boolean "active", default: true
    t.integer "structure_id"
    t.string "structurable_type", null: false
    t.bigint "structurable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["structurable_type", "structurable_id"], name: "index_structures_on_structurable"
    t.index ["user_id"], name: "index_structures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: true
    t.string "device"
    t.text "device_desc"
    t.string "phone_token"
    t.boolean "phone_confirmed", default: false
    t.datetime "phone_token_sent_at"
    t.datetime "phone_confirmed_at"
    t.string "email_token"
    t.boolean "email_confirmed", default: false
    t.datetime "email_token_sent_at"
    t.datetime "email_confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "user_confirmed", default: false
    t.boolean "forgot_password", default: false
    t.datetime "reset_password_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "reset_password_reset_at"
    t.integer "reset_password_count", default: 0
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "unlocked_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_token"], name: "index_users_on_email_token", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["phone_token"], name: "index_users_on_phone_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "account_id"
    t.bigint "role_id"
    t.boolean "active"
    t.index ["account_id"], name: "index_users_roles_on_account_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id", "account_id"], name: "index_users_roles_on_user_id_and_role_id_and_account_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "codes", "products"
  add_foreign_key "codes", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "prices", "codes"
  add_foreign_key "prices", "users"
  add_foreign_key "products", "users"
  add_foreign_key "structures", "users"
end
