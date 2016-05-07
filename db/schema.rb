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

ActiveRecord::Schema.define(version: 20160504053649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "academia", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "academia_takings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "academy_id"
  end

  add_index "academia_takings", ["academy_id"], name: "index_academia_takings_on_academy_id", using: :btree
  add_index "academia_takings", ["user_id"], name: "index_academia_takings_on_user_id", using: :btree

  create_table "academies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "answers", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "content"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.integer  "likers_count",            default: 0
    t.string   "document"
  end

  add_index "answers", ["cached_votes_down"], name: "index_answers_on_cached_votes_down", using: :btree
  add_index "answers", ["cached_votes_score"], name: "index_answers_on_cached_votes_score", using: :btree
  add_index "answers", ["cached_votes_total"], name: "index_answers_on_cached_votes_total", using: :btree
  add_index "answers", ["cached_votes_up"], name: "index_answers_on_cached_votes_up", using: :btree
  add_index "answers", ["cached_weighted_average"], name: "index_answers_on_cached_weighted_average", using: :btree
  add_index "answers", ["cached_weighted_score"], name: "index_answers_on_cached_weighted_score", using: :btree
  add_index "answers", ["cached_weighted_total"], name: "index_answers_on_cached_weighted_total", using: :btree
  add_index "answers", ["topic_id"], name: "index_answers_on_topic_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "appear_ins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "topic_id"
  end

  add_index "appear_ins", ["course_id"], name: "index_appear_ins_on_course_id", using: :btree
  add_index "appear_ins", ["topic_id"], name: "index_appear_ins_on_topic_id", using: :btree
  add_index "appear_ins", ["user_id"], name: "index_appear_ins_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.string   "free_trial_length"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "followers_count", default: 0
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feeds", ["topic_id"], name: "index_feeds_on_topic_id", using: :btree
  add_index "feeds", ["user_id"], name: "index_feeds_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

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
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.string   "stripe_id"
    t.float    "price"
    t.string   "interval"
    t.text     "features"
    t.boolean  "highlight"
    t.integer  "display_order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "stripe_id"
    t.integer  "plan_id"
    t.string   "last_four"
    t.integer  "coupon_id"
    t.string   "card_type"
    t.float    "current_price"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "test_preparings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "primary_preparing", default: false
  end

  add_index "test_preparings", ["course_id"], name: "index_test_preparings_on_course_id", using: :btree
  add_index "test_preparings", ["user_id"], name: "index_test_preparings_on_user_id", using: :btree

  create_table "test_takings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "source_id"
    t.integer  "course_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "subject"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "course_id"
    t.integer  "category_id"
    t.integer  "academy_id"
    t.integer  "cached_views_count", default: 0
    t.integer  "answers_count",      default: 0
  end

  add_index "topics", ["academy_id"], name: "index_topics_on_academy_id", using: :btree
  add_index "topics", ["course_id"], name: "index_topics_on_course_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "anonymous"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
    t.string   "current_academy"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "academia_takings", "academies"
  add_foreign_key "academia_takings", "users"
  add_foreign_key "answers", "topics"
  add_foreign_key "answers", "users"
  add_foreign_key "appear_ins", "courses"
  add_foreign_key "appear_ins", "topics"
  add_foreign_key "appear_ins", "users"
  add_foreign_key "feeds", "topics"
  add_foreign_key "feeds", "users"
  add_foreign_key "test_preparings", "courses"
  add_foreign_key "test_preparings", "users"
  add_foreign_key "topics", "academies"
  add_foreign_key "topics", "courses"
end
