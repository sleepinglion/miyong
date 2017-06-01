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

ActiveRecord::Schema.define(version: 20140314055337) do

  create_table "ad_positions", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.string   "position",   limit: 20,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["position"], name: "index_ad_positions_on_position", unique: true
    t.index ["title"], name: "index_ad_positions_on_title", unique: true
  end

  create_table "blog_categories", force: :cascade do |t|
    t.integer  "user_id",                                         null: false
    t.integer  "blog_category_id"
    t.string   "title",                 limit: 60,                null: false
    t.integer  "blogs_count",                      default: 0,    null: false
    t.integer  "blog_categories_count",            default: 0,    null: false
    t.boolean  "enable",                           default: true, null: false
    t.boolean  "leaf",                             default: true
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["blog_category_id"], name: "index_blog_categories_on_blog_category_id"
    t.index ["title"], name: "index_blog_categories_on_title", unique: true
    t.index ["user_id"], name: "index_blog_categories_on_user_id"
  end

  create_table "blog_category_rels", force: :cascade do |t|
    t.integer  "blog_category_id",     null: false
    t.integer  "blog_category_rel_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["blog_category_id"], name: "index_blog_category_rels_on_blog_category_id"
    t.index ["blog_category_rel_id"], name: "index_blog_category_rels_on_blog_category_rel_id"
  end

  create_table "blog_comments", force: :cascade do |t|
    t.integer  "blog_id",                       null: false
    t.integer  "user_id"
    t.string   "title",              limit: 60, null: false
    t.string   "name",               limit: 60
    t.string   "encrypted_password", limit: 40
    t.string   "salt",               limit: 40
    t.text     "content",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["blog_id"], name: "index_blog_comments_on_blog_id"
    t.index ["user_id"], name: "index_blog_comments_on_user_id"
  end

  create_table "blog_contents", force: :cascade do |t|
    t.text "content"
  end

  create_table "blog_types", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id",                                        null: false
    t.integer  "blog_category_id",                               null: false
    t.string   "title",               limit: 60,                 null: false
    t.string   "description",         limit: 255,                null: false
    t.string   "photo"
    t.integer  "blog_comments_count",             default: 0,    null: false
    t.integer  "count",                           default: 0,    null: false
    t.boolean  "enable",                          default: true, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["blog_category_id"], name: "index_blogs_on_blog_category_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "faq_categories", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faq_contents", force: :cascade do |t|
    t.string "content"
  end

  create_table "faqs", force: :cascade do |t|
    t.integer  "faq_category_id",             null: false
    t.string   "title",                       null: false
    t.integer  "count",           default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["faq_category_id"], name: "index_faqs_on_faq_category_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.integer  "user_id",                                        null: false
    t.integer  "gallery_category_id",                            null: false
    t.string   "title",               limit: 60,                 null: false
    t.string   "content",             limit: 255,                null: false
    t.string   "location",            limit: 255
    t.string   "photo",                                          null: false
    t.integer  "count",                           default: 0,    null: false
    t.boolean  "enable",                          default: true, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["gallery_category_id"], name: "index_galleries_on_gallery_category_id"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "gallery_categories", force: :cascade do |t|
    t.integer  "user_id",                                   null: false
    t.string   "title",           limit: 60,                null: false
    t.integer  "galleries_count",            default: 0,    null: false
    t.boolean  "enable",                     default: true, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["title"], name: "index_gallery_categories_on_title", unique: true
    t.index ["user_id"], name: "index_gallery_categories_on_user_id"
  end

  create_table "guest_book_comments", force: :cascade do |t|
    t.integer  "guest_book_id",                 null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "encrypted_password", limit: 40
    t.string   "salt"
    t.text     "content",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["guest_book_id"], name: "index_guest_book_comments_on_guest_book_id"
    t.index ["user_id"], name: "index_guest_book_comments_on_user_id"
  end

  create_table "guest_book_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "guest_books", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                     limit: 60,             null: false
    t.string   "name",                      limit: 60
    t.string   "encrypted_password",        limit: 40
    t.string   "salt"
    t.integer  "guest_book_comments_count",            default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                                default: 0, null: false
    t.index ["user_id"], name: "index_guest_books_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.string   "year",       limit: 40, null: false
    t.string   "title",      limit: 60, null: false
    t.text     "content",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "notice_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "user_id",                           null: false
    t.string   "title",      limit: 60,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                 default: 0, null: false
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "title",          limit: 60,                null: false
    t.integer  "products_count",            default: 0,    null: false
    t.boolean  "enable",                    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_comments", force: :cascade do |t|
    t.integer  "product_id",            null: false
    t.string   "title",      limit: 60, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_product_comments_on_product_id"
  end

  create_table "product_contents", force: :cascade do |t|
    t.string "content"
  end

  create_table "product_question_comments", force: :cascade do |t|
    t.integer  "product_question_id", null: false
    t.string   "name",                null: false
    t.string   "password",            null: false
    t.text     "content",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_question_id"], name: "index_product_question_comments_on_product_question_id"
  end

  create_table "product_question_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "product_questions", force: :cascade do |t|
    t.integer  "product_id",                        null: false
    t.string   "title",      limit: 60,             null: false
    t.string   "name",       limit: 60,             null: false
    t.string   "password",   limit: 40,             null: false
    t.integer  "comment",               default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_category_id",               null: false
    t.integer  "user_id",                           null: false
    t.string   "title",                             null: false
    t.float    "price",               default: 0.0, null: false
    t.text     "description",                       null: false
    t.string   "photo",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "question_comments", force: :cascade do |t|
    t.integer  "question_id",                   null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "encrypted_password", limit: 40
    t.string   "salt"
    t.text     "content",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["question_id"], name: "index_question_comments_on_question_id"
    t.index ["user_id"], name: "index_question_comments_on_user_id"
  end

  create_table "question_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                   limit: 60,                null: false
    t.string   "name",                    limit: 60
    t.string   "encrypted_password",      limit: 40
    t.string   "salt"
    t.integer  "secret",                             default: 0,    null: false
    t.integer  "question_comments_count",            default: 0,    null: false
    t.boolean  "enable",                             default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                              default: 0,    null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "resource_photos", force: :cascade do |t|
    t.string   "photo",                                null: false
    t.string   "alt",        limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "ad_position_id",                            null: false
    t.string   "title",          limit: 60,                 null: false
    t.string   "description"
    t.string   "controller",     limit: 60,                 null: false
    t.string   "menu_action",    limit: 60
    t.boolean  "use_category",              default: false, null: false
    t.boolean  "menu_display",              default: true,  null: false
    t.boolean  "enable",                    default: true,  null: false
    t.integer  "priority",                  default: 100,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ad_position_id"], name: "index_resources_on_ad_position_id"
    t.index ["controller"], name: "index_resources_on_controller", unique: true
    t.index ["title"], name: "index_resources_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                             null: false
    t.string   "name",                   limit: 60,                 null: false
    t.string   "encrypted_password",                                null: false
    t.string   "photo"
    t.string   "description"
    t.string   "alternate_name",         limit: 60
    t.boolean  "gender",                            default: true
    t.date     "birth_date"
    t.date     "death_date"
    t.string   "url"
    t.string   "job_title",              limit: 60
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                             default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
