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

ActiveRecord::Schema.define(version: 2021_03_31_103152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "organizations", "users"
  add_foreign_key "structures", "users"
end
