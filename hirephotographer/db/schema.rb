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

ActiveRecord::Schema.define(version: 20161022170045) do

  create_table "applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "job_detail_id"
    t.integer  "hire_detail_id"
    t.date     "submitted"
    t.date     "created"
    t.string   "status"
    t.string   "hirestatus"
    t.string   "hireDetail_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "expectedsalary", limit: 53
    t.date     "availablefrom"
    t.string   "coverletter"
    t.index ["hire_detail_id"], name: "index_applications_on_hire_detail_id", using: :btree
    t.index ["job_detail_id"], name: "index_applications_on_job_detail_id", using: :btree
    t.index ["user_id"], name: "fk_rails_e0102d7aca_idx", using: :btree
  end

  create_table "certifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.date     "validTill"
    t.string   "organizaion"
    t.string   "description"
    t.string   "result"
    t.string   "remark"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["profile_id"], name: "index_certifications_on_profile_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "comment"
    t.string   "feedback"
    t.string   "commentby"
    t.string   "commentat"
    t.integer  "profile_id"
    t.integer  "feedback_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["feedback_id"], name: "index_comments_on_feedback_id", using: :btree
    t.index ["profile_id"], name: "index_comments_on_profile_id", using: :btree
  end

  create_table "conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_conversations_on_sender_id", using: :btree
  end

  create_table "customer_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "fk_rails_75fccc7e59_idx", using: :btree
  end

  create_table "educations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "degree"
    t.date     "startDate"
    t.date     "endDate"
    t.date     "graduatedate"
    t.string   "school"
    t.string   "major"
    t.string   "result"
    t.string   "remark"
    t.integer  "profile_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["profile_id"], name: "index_educations_on_profile_id", using: :btree
  end

  create_table "experiences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customername"
    t.date     "startDate"
    t.date     "endDate"
    t.boolean  "ongoing"
    t.string   "organizaion"
    t.string   "description"
    t.string   "role"
    t.string   "remark"
    t.integer  "profile_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["profile_id"], name: "index_experiences_on_profile_id", using: :btree
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "givenby"
    t.string   "givento"
    t.integer  "customer_user_id"
    t.integer  "photographer_user_id"
    t.string   "parentfeedback"
    t.string   "comment"
    t.string   "feedback"
    t.date     "givenat"
    t.integer  "profile_id"
    t.integer  "experience_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["customer_user_id"], name: "fk_giverby_idx", using: :btree
    t.index ["experience_id"], name: "index_feedbacks_on_experience_id", using: :btree
    t.index ["photographer_user_id"], name: "fk_givento_idx", using: :btree
    t.index ["profile_id"], name: "index_feedbacks_on_profile_id", using: :btree
  end

  create_table "hire_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "job_detail_id"
    t.integer  "customer_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["customer_user_id"], name: "index_hire_details_on_customer_user_id", using: :btree
    t.index ["job_detail_id"], name: "index_hire_details_on_job_detail_id", using: :btree
  end

  create_table "job_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "jobTitle"
    t.date     "validTill"
    t.string   "status"
    t.string   "hiredetail"
    t.date     "createdon"
    t.integer  "salary"
    t.string   "jobRequirementId"
    t.string   "type"
    t.string   "location"
    t.date     "startDate"
    t.date     "endDate"
    t.float    "min_salary",       limit: 24
    t.float    "max_salary",       limit: 24
    t.integer  "hours_per_week"
    t.float    "min_rate",         limit: 24
    t.float    "max_rate",         limit: 24
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "fk_rails_e532ce228d_idx", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_user_id"
    t.integer  "job_detail_id"
    t.integer  "hire_detail_id"
    t.integer  "photographer_user_id"
    t.date     "date"
    t.float    "amount",               limit: 24
    t.string   "status"
    t.string   "remark"
    t.string   "paymentmethod"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["customer_user_id"], name: "index_payments_on_customer_user_id", using: :btree
    t.index ["hire_detail_id"], name: "index_payments_on_hire_detail_id", using: :btree
    t.index ["job_detail_id"], name: "index_payments_on_job_detail_id", using: :btree
    t.index ["photographer_user_id"], name: "index_payments_on_photographer_user_id", using: :btree
  end

  create_table "personalinformations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middlename"
    t.date     "dateofbirth"
    t.string   "nationalid"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.string   "country"
    t.string   "mobile"
    t.string   "phone"
    t.string   "secondaryEmail"
    t.string   "birthcountry"
    t.string   "summary"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "photographer_user_id"
    t.index ["user_id"], name: "fk_rails_eba8b16b7c_idx", using: :btree
  end

  create_table "photographer_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "fk_rails_3d8fd55190_idx", using: :btree
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "location"
    t.string   "description"
    t.string   "customer"
    t.string   "url"
    t.binary   "data",        limit: 65535
    t.string   "camerainfo"
    t.date     "date"
    t.string   "remark"
    t.integer  "profile_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["profile_id"], name: "index_photos_on_profile_id", using: :btree
  end

  create_table "profilepictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "personalinformation_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["personalinformation_id"], name: "index_profilepictures_on_personalinformations_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "photographer_user_id"
    t.index ["user_id"], name: "fk_rails_d66c29f2e5_idx", using: :btree
  end

  create_table "trainings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.date     "validTill"
    t.string   "organizaion"
    t.string   "description"
    t.string   "result"
    t.string   "remark"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["profile_id"], name: "index_trainings_on_profile_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "role"
    t.boolean  "status"
    t.string   "confirm_token"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_foreign_key "applications", "hire_details"
  add_foreign_key "applications", "job_details"
  add_foreign_key "applications", "users"
  add_foreign_key "certifications", "profiles"
  add_foreign_key "comments", "feedbacks"
  add_foreign_key "comments", "profiles"
  add_foreign_key "customer_users", "users"
  add_foreign_key "educations", "profiles"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "feedbacks", "experiences"
  add_foreign_key "feedbacks", "profiles"
  add_foreign_key "feedbacks", "users", column: "customer_user_id", name: "fk_giverby"
  add_foreign_key "feedbacks", "users", column: "photographer_user_id", name: "fk_givento"
  add_foreign_key "hire_details", "customer_users"
  add_foreign_key "hire_details", "job_details"
  add_foreign_key "job_details", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "payments", "customer_users"
  add_foreign_key "payments", "hire_details"
  add_foreign_key "payments", "job_details"
  add_foreign_key "payments", "photographer_users"
  add_foreign_key "personalinformations", "users"
  add_foreign_key "photographer_users", "users"
  add_foreign_key "photos", "profiles"
  add_foreign_key "profilepictures", "personalinformations"
  add_foreign_key "profiles", "users"
  add_foreign_key "trainings", "profiles"
end
