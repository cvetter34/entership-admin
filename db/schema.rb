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

ActiveRecord::Schema.define(version: 20141014073437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "apps", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.integer  "status",                 default: 1
    t.string   "name_given",                             null: false
    t.string   "name_family",                            null: false
    t.integer  "age"
    t.string   "nationality_code"
    t.string   "country_code"
    t.string   "phone",                                  null: false
    t.string   "email",                                  null: false
    t.text     "comments"
    t.text     "personal_statement"
    t.boolean  "has_right_to_work",      default: false
    t.boolean  "has_work_permit",        default: false
    t.text     "work_permit_detail"
    t.uuid     "member_id"
    t.uuid     "job_id"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
    t.string   "doc_one_file_name"
    t.string   "doc_one_content_type"
    t.integer  "doc_one_file_size"
    t.datetime "doc_one_updated_at"
    t.string   "doc_two_file_name"
    t.string   "doc_two_content_type"
    t.integer  "doc_two_file_size"
    t.datetime "doc_two_updated_at"
    t.string   "doc_three_file_name"
    t.string   "doc_three_content_type"
    t.integer  "doc_three_file_size"
    t.datetime "doc_three_updated_at"
    t.string   "doc_four_file_name"
    t.string   "doc_four_content_type"
    t.integer  "doc_four_file_size"
    t.datetime "doc_four_updated_at"
    t.string   "link_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "slug",                                      null: false
    t.string   "email",                                     null: false
    t.string   "salt",                                      null: false
    t.string   "fish",                                      null: false
    t.string   "password_reset_code"
    t.datetime "password_reset_expires_at"
    t.string   "name",                                      null: false
    t.string   "package",                                   null: false
    t.string   "country_code",                              null: false
    t.integer  "sectors",                   default: [],    null: false, array: true
    t.string   "phone",                                     null: false
    t.string   "website_url",                               null: false
    t.text     "address",                                   null: false
    t.text     "address_alt"
    t.string   "contact_email",                             null: false
    t.string   "contact_person"
    t.integer  "company_type"
    t.integer  "company_size"
    t.string   "mobile"
    t.string   "fax"
    t.integer  "year_founded"
    t.text     "description"
    t.boolean  "is_vetted",                 default: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name", "country_code"], name: "index_companies_on_name_and_country_code", unique: true, using: :btree
  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true, using: :btree

  create_table "contacts", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "subject",                       null: false
    t.text     "body",                          null: false
    t.boolean  "has_been_seen", default: false
    t.uuid     "member_id"
    t.uuid     "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "jobs", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "title",                             null: false
    t.string   "job_reference"
    t.text     "description"
    t.text     "responsibilities"
    t.text     "ideal_candidate"
    t.integer  "num_positions",     default: 1,     null: false
    t.integer  "contract_type",                     null: false
    t.integer  "sector",                            null: false
    t.string   "city"
    t.string   "country_code",                      null: false
    t.string   "postal_code"
    t.string   "email",                             null: false
    t.integer  "experience_level"
    t.integer  "salary_cents",      default: 0,     null: false
    t.string   "salary_currency",   default: "HKD", null: false
    t.integer  "salary_frequency",  default: 1
    t.string   "contact_person"
    t.date     "posted_on"
    t.date     "deadline_on"
    t.date     "expired_on"
    t.boolean  "is_verified",       default: false
    t.string   "verification_code"
    t.uuid     "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["job_reference", "company_id"], name: "index_jobs_on_job_reference_and_company_id", unique: true, using: :btree

  create_table "managers", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name",                                      null: false
    t.string   "email",                                     null: false
    t.string   "salt",                                      null: false
    t.string   "fish",                                      null: false
    t.string   "password_reset_code"
    t.datetime "password_reset_expires_at"
    t.boolean  "is_director",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["name"], name: "index_managers_on_name", unique: true, using: :btree
  add_index "managers", ["password_reset_code"], name: "index_managers_on_password_reset_code", unique: true, using: :btree

  create_table "members", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "slug",                                      null: false
    t.string   "email",                                     null: false
    t.string   "salt",                                      null: false
    t.string   "fish",                                      null: false
    t.string   "password_reset_code"
    t.datetime "password_reset_expires_at"
    t.integer  "title",                     default: 2,     null: false
    t.string   "name_given",                                null: false
    t.string   "name_family",                               null: false
    t.date     "born_on",                                   null: false
    t.string   "nationality_code"
    t.string   "country_code"
    t.text     "street_address",                            null: false
    t.string   "city",                                      null: false
    t.string   "postal_code",                               null: false
    t.string   "occupation"
    t.integer  "sectors",                   default: [],                 array: true
    t.string   "phone",                                     null: false
    t.string   "mobile"
    t.string   "website_url"
    t.integer  "notice"
    t.boolean  "will_relocate",             default: false, null: false
    t.integer  "current_status",                            null: false
    t.integer  "experience",                                null: false
    t.boolean  "hide_born_on",              default: false, null: false
    t.boolean  "hide_status",               default: false, null: false
    t.boolean  "is_public",                 default: true
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["password_reset_code"], name: "index_members_on_password_reset_code", unique: true, using: :btree
  add_index "members", ["slug"], name: "index_members_on_slug", unique: true, using: :btree

  create_table "registrants", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                              null: false
    t.string   "sign_up_code",                       null: false
    t.datetime "sign_up_expires_at",                 null: false
    t.boolean  "is_company",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrants", ["email"], name: "index_registrants_on_email", unique: true, using: :btree
  add_index "registrants", ["sign_up_code"], name: "index_registrants_on_sign_up_code", unique: true, using: :btree

end
