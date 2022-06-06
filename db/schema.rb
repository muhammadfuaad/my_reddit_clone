ActiveRecord::Schema[7.0].define(version: 2022_06_01_165130) do
  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.text "bio"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "communities", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.string "url"
    t.text "rules"
    t.integer "total_numbers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_communities_on_account_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "account_id"
    t.integer "community_id"
    t.string "title"
    t.text "body"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.integer "total_comments", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_posts_on_account_id"
    t.index ["community_id"], name: "index_posts_on_community_id"
  end

end
