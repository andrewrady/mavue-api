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

ActiveRecord::Schema.define(version: 20190426202912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.date "startDate"
    t.date "endDate"
    t.integer "lastFour"
    t.float "amount"
    t.bigint "head_of_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "downPaymentAmount"
    t.index ["head_of_house_id"], name: "index_contracts_on_head_of_house_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "head_of_houses", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "state"
    t.string "address"
    t.integer "zip"
    t.string "email"
    t.string "phoneNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_head_of_houses_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "item_number"
    t.string "name"
    t.float "price"
    t.boolean "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "tuition"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "description"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_notes_on_student_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "price"
    t.float "downPayment"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ranks_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.text "items"
    t.float "total"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "maskedPan"
    t.string "cardType"
    t.string "lastFour"
    t.string "referenceNumber"
    t.string "authCode"
    t.string "authResponse"
    t.index ["student_id"], name: "index_sales_on_student_id"
  end

  create_table "sales_taxes", force: :cascade do |t|
    t.integer "percent"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sales_taxes_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "rank"
    t.integer "ata_number"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.boolean "Instructor"
    t.string "phoneNumber"
    t.bigint "head_of_house_id"
    t.string "email"
    t.index ["head_of_house_id"], name: "index_students_on_head_of_house_id"
    t.index ["users_id"], name: "index_students_on_users_id"
  end

  create_table "testing_instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rank"
    t.bigint "testing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["testing_id"], name: "index_testing_instructors_on_testing_id"
  end

  create_table "testing_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "testing_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "total"
    t.integer "form"
    t.integer "sparring"
    t.integer "weapon"
    t.integer "board"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rank"
    t.string "size"
    t.index ["student_id"], name: "index_testing_students_on_student_id"
    t.index ["testing_id"], name: "index_testing_students_on_testing_id"
  end

  create_table "testings", force: :cascade do |t|
    t.boolean "complete"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_testings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "company"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "head_of_houses"
  add_foreign_key "emails", "users"
  add_foreign_key "head_of_houses", "users"
  add_foreign_key "inventories", "users"
  add_foreign_key "notes", "students"
  add_foreign_key "programs", "users"
  add_foreign_key "ranks", "users"
  add_foreign_key "sales", "students"
  add_foreign_key "sales_taxes", "users"
  add_foreign_key "students", "head_of_houses"
  add_foreign_key "students", "users", column: "users_id"
  add_foreign_key "testing_instructors", "testings"
  add_foreign_key "testing_students", "students"
  add_foreign_key "testing_students", "testings"
  add_foreign_key "testings", "users"
end
