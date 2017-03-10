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

ActiveRecord::Schema.define(version: 20170308215247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ClientApps", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "secret",       limit: 255
    t.datetime "lastAccessed"
    t.json     "authParams"
    t.datetime "createdAt",                null: false
    t.datetime "updatedAt",                null: false
  end

  create_table "Reports", force: :cascade do |t|
    t.string   "callbackUrl",   limit: 255
    t.string   "printableUrl",  limit: 255
    t.datetime "dateRequested"
    t.datetime "dateCompleted"
    t.json     "params"
    t.boolean  "sync"
    t.datetime "createdAt",                 null: false
    t.datetime "updatedAt",                 null: false
    t.integer  "ClientAppId"
  end

  create_table "advanced_comments_commentallowhiddenname", primary_key: "comment_ptr_id", id: :integer, force: :cascade do |t|
    t.boolean "hide_name", null: false
  end

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index "name varchar_pattern_ops", name: "auth_group_name_like", using: :btree
    t.index ["name"], name: "auth_group_name_key", unique: true, using: :btree
  end

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_key", unique: true, using: :btree
    t.index ["group_id"], name: "auth_group_permissions_group_id", using: :btree
    t.index ["permission_id"], name: "auth_group_permissions_permission_id", using: :btree
  end

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_key", unique: true, using: :btree
    t.index ["content_type_id"], name: "auth_permission_content_type_id", using: :btree
  end

  create_table "auth_user", force: :cascade do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login",               null: false
    t.boolean  "is_superuser",             null: false
    t.string   "username",     limit: 75,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 75,  null: false
    t.boolean  "is_staff",                 null: false
    t.boolean  "is_active",                null: false
    t.datetime "date_joined",              null: false
    t.index "lower((email)::text)", name: "auth_user__unique_email", unique: true, using: :btree
    t.index "username varchar_pattern_ops", name: "auth_user_username_like", using: :btree
    t.index ["email"], name: "auth_user_email", unique: true, using: :btree
    t.index ["username"], name: "auth_user_username_key", unique: true, using: :btree
  end

  create_table "auth_user_groups", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_key", unique: true, using: :btree
    t.index ["user_id"], name: "auth_user_groups_user_id", using: :btree
  end

  create_table "auth_user_user_permissions", force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id", using: :btree
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_key", unique: true, using: :btree
    t.index ["user_id"], name: "auth_user_user_permissions_user_id", using: :btree
  end

  create_table "celery_taskmeta", force: :cascade do |t|
    t.string   "task_id",   limit: 255, null: false
    t.string   "status",    limit: 50,  null: false
    t.text     "result"
    t.datetime "date_done",             null: false
    t.text     "traceback"
    t.boolean  "hidden",                null: false
    t.text     "meta"
    t.index "task_id varchar_pattern_ops", name: "celery_taskmeta_task_id_like", using: :btree
    t.index ["hidden"], name: "celery_taskmeta_hidden", using: :btree
    t.index ["task_id"], name: "celery_taskmeta_task_id_key", unique: true, using: :btree
  end

  create_table "celery_tasksetmeta", force: :cascade do |t|
    t.string   "taskset_id", limit: 255, null: false
    t.text     "result",                 null: false
    t.datetime "date_done",              null: false
    t.boolean  "hidden",                 null: false
    t.index "taskset_id varchar_pattern_ops", name: "celery_tasksetmeta_taskset_id_like", using: :btree
    t.index ["hidden"], name: "celery_tasksetmeta_hidden", using: :btree
    t.index ["taskset_id"], name: "celery_tasksetmeta_taskset_id_key", unique: true, using: :btree
  end

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                 null: false
    t.integer  "user_id",                     null: false
    t.integer  "content_type_id"
    t.text     "object_id"
    t.string   "object_repr",     limit: 200, null: false
    t.integer  "action_flag",     limit: 2,   null: false
    t.text     "change_message",              null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id", using: :btree
    t.index ["user_id"], name: "django_admin_log_user_id", using: :btree
  end

  create_table "django_comment_flags", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.integer  "comment_id",            null: false
    t.string   "flag",       limit: 30, null: false
    t.datetime "flag_date",             null: false
    t.index "flag varchar_pattern_ops", name: "django_comment_flags_flag_like", using: :btree
    t.index ["comment_id"], name: "django_comment_flags_comment_id", using: :btree
    t.index ["flag"], name: "django_comment_flags_flag", using: :btree
    t.index ["user_id", "comment_id", "flag"], name: "django_comment_flags_user_id_comment_id_flag_key", unique: true, using: :btree
    t.index ["user_id"], name: "django_comment_flags_user_id", using: :btree
  end

  create_table "django_comments", force: :cascade do |t|
    t.integer  "content_type_id",             null: false
    t.text     "object_pk",                   null: false
    t.integer  "site_id",                     null: false
    t.integer  "user_id"
    t.string   "user_name",       limit: 50,  null: false
    t.string   "user_email",      limit: 75,  null: false
    t.string   "user_url",        limit: 200, null: false
    t.text     "comment",                     null: false
    t.datetime "submit_date",                 null: false
    t.inet     "ip_address"
    t.boolean  "is_public",                   null: false
    t.boolean  "is_removed",                  null: false
    t.index ["content_type_id"], name: "django_comments_content_type_id", using: :btree
    t.index ["site_id"], name: "django_comments_site_id", using: :btree
    t.index ["user_id"], name: "django_comments_user_id", using: :btree
  end

  create_table "django_content_type", force: :cascade do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_key", unique: true, using: :btree
  end

  create_table "django_site", force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "djcelery_crontabschedule", force: :cascade do |t|
    t.string "minute",        limit: 64, null: false
    t.string "hour",          limit: 64, null: false
    t.string "day_of_week",   limit: 64, null: false
    t.string "day_of_month",  limit: 64, null: false
    t.string "month_of_year", limit: 64, null: false
  end

  create_table "djcelery_intervalschedule", force: :cascade do |t|
    t.integer "every",             null: false
    t.string  "period", limit: 24, null: false
  end

  create_table "djcelery_periodictask", force: :cascade do |t|
    t.string   "name",            limit: 200, null: false
    t.string   "task",            limit: 200, null: false
    t.integer  "interval_id"
    t.integer  "crontab_id"
    t.text     "args",                        null: false
    t.text     "kwargs",                      null: false
    t.string   "queue",           limit: 200
    t.string   "exchange",        limit: 200
    t.string   "routing_key",     limit: 200
    t.datetime "expires"
    t.boolean  "enabled",                     null: false
    t.datetime "last_run_at"
    t.integer  "total_run_count",             null: false
    t.datetime "date_changed",                null: false
    t.text     "description",                 null: false
    t.index "name varchar_pattern_ops", name: "djcelery_periodictask_name_like", using: :btree
    t.index ["crontab_id"], name: "djcelery_periodictask_crontab_id", using: :btree
    t.index ["interval_id"], name: "djcelery_periodictask_interval_id", using: :btree
    t.index ["name"], name: "djcelery_periodictask_name_key", unique: true, using: :btree
  end

  create_table "djcelery_periodictasks", primary_key: "ident", id: :integer, limit: 2, force: :cascade do |t|
    t.datetime "last_update", null: false
  end

  create_table "djcelery_taskstate", force: :cascade do |t|
    t.string   "state",     limit: 64,  null: false
    t.string   "task_id",   limit: 36,  null: false
    t.string   "name",      limit: 200
    t.datetime "tstamp",                null: false
    t.text     "args"
    t.text     "kwargs"
    t.datetime "eta"
    t.datetime "expires"
    t.text     "result"
    t.text     "traceback"
    t.float    "runtime"
    t.integer  "retries",               null: false
    t.integer  "worker_id"
    t.boolean  "hidden",                null: false
    t.index "name varchar_pattern_ops", name: "djcelery_taskstate_name_like", using: :btree
    t.index "state varchar_pattern_ops", name: "djcelery_taskstate_state_like", using: :btree
    t.index "task_id varchar_pattern_ops", name: "djcelery_taskstate_task_id_like", using: :btree
    t.index ["hidden"], name: "djcelery_taskstate_hidden", using: :btree
    t.index ["name"], name: "djcelery_taskstate_name", using: :btree
    t.index ["state"], name: "djcelery_taskstate_state", using: :btree
    t.index ["task_id"], name: "djcelery_taskstate_task_id_key", unique: true, using: :btree
    t.index ["tstamp"], name: "djcelery_taskstate_tstamp", using: :btree
    t.index ["worker_id"], name: "djcelery_taskstate_worker_id", using: :btree
  end

  create_table "djcelery_workerstate", force: :cascade do |t|
    t.string   "hostname",       limit: 255, null: false
    t.datetime "last_heartbeat"
    t.index "hostname varchar_pattern_ops", name: "djcelery_workerstate_hostname_like", using: :btree
    t.index ["hostname"], name: "djcelery_workerstate_hostname_key", unique: true, using: :btree
    t.index ["last_heartbeat"], name: "djcelery_workerstate_last_heartbeat", using: :btree
  end

  create_table "feedrank_feedattackstats", force: :cascade do |t|
    t.bigint  "feed_id",             null: false
    t.string  "feed_type", limit: 1, null: false
    t.bigint  "org_id",              null: false
    t.integer "count",               null: false
    t.index ["org_id", "feed_type", "feed_id"], name: "feedrank_feedattackstats_org_id_4e14d744f2f65bd2_uniq", unique: true, using: :btree
  end

  create_table "feedrank_feedoverlapstats", force: :cascade do |t|
    t.bigint  "feed_id",              null: false
    t.string  "feed_type",  limit: 1, null: false
    t.bigint  "feed2_id",             null: false
    t.string  "feed2_type", limit: 1, null: false
    t.integer "count",                null: false
    t.integer "days_ahead",           null: false
    t.index ["feed_id", "feed_type", "feed2_id", "feed2_type"], name: "feedrank_feedoverlapstats_feed_id_4dfd10cee0fa864e_uniq", unique: true, using: :btree
  end

  create_table "feedrank_feedstats", force: :cascade do |t|
    t.bigint   "feed_id",                    null: false
    t.string   "feed_type",      limit: 1,   null: false
    t.string   "name",           limit: 120, null: false
    t.integer  "cluster_group",              null: false
    t.integer  "total_count",                null: false
    t.integer  "unique_count",               null: false
    t.integer  "falsepos_count",             null: false
    t.float    "feed_score"
    t.json     "itypes"
    t.datetime "modified_ts"
    t.index ["feed_type", "feed_id"], name: "feedrank_feedstats_feed_type_3f1e0f2253e67bab_uniq", unique: true, using: :btree
  end

  create_table "intelligence", id: :bigserial, force: :cascade do |t|
    t.string   "type",                       limit: 10,                                          null: false
    t.string   "value",                      limit: 2048,                                        null: false
    t.string   "ip",                         limit: 45
    t.string   "rdns",                       limit: 253
    t.bigint   "owner_organization_id",                                                          null: false
    t.bigint   "feed_id",                                                         default: 0,    null: false
    t.string   "country",                    limit: 2
    t.decimal  "latitude",                                precision: 9, scale: 6
    t.decimal  "longitude",                               precision: 9, scale: 6
    t.string   "org",                        limit: 50
    t.string   "asn",                        limit: 8
    t.string   "status",                     limit: 10,                                          null: false
    t.boolean  "is_public",                                                       default: true, null: false
    t.integer  "confidence",                                                      default: 0,    null: false
    t.json     "tags",                                                            default: [],   null: false
    t.json     "meta",                                                            default: {},   null: false
    t.bigint   "import_session_id"
    t.datetime "created_ts",                                                                     null: false
    t.datetime "modified_ts",                                                                    null: false
    t.string   "itype",                      limit: 25,                                          null: false
    t.integer  "source_reported_confidence"
    t.integer  "retina_confidence"
    t.bigint   "update_id"
    t.datetime "expiration_ts"
    t.index "itype varchar_pattern_ops", name: "intelligence_itype_like", using: :btree
    t.index ["created_ts"], name: "intelligence_created_ts_idx", using: :btree
    t.index ["expiration_ts"], name: "intelligence_expiration_ts", using: :btree
    t.index ["feed_id"], name: "intelligence_feed_id", using: :btree
    t.index ["import_session_id"], name: "intelligence_import_session_id_idx", using: :btree
    t.index ["itype"], name: "intelligence_itype", using: :btree
    t.index ["modified_ts"], name: "intelligence_modified_ts_idx", using: :btree
    t.index ["owner_organization_id"], name: "intelligence_owner_organization_id_idx", using: :btree
    t.index ["type", "value", "owner_organization_id", "feed_id"], name: "intelligence_unique_idx", unique: true, using: :btree
    t.index ["type"], name: "intelligence_type_idx", using: :btree
    t.index ["update_id"], name: "intelligence_update_id", using: :btree
  end

  create_table "intelligence_circles", force: :cascade do |t|
    t.integer "intelligence2_id", null: false
    t.integer "trustedcircle_id", null: false
    t.index ["intelligence2_id", "trustedcircle_id"], name: "intelligence_circles_intelligence2_id_52554fcff50caa8b_uniq", unique: true, using: :btree
    t.index ["intelligence2_id"], name: "intelligence_circles_intelligence2_id", using: :btree
    t.index ["trustedcircle_id"], name: "intelligence_circles_trustedcircle_id", using: :btree
  end

  create_table "intelligence_downvotes", force: :cascade do |t|
    t.integer "intelligence2_id", null: false
    t.integer "user_id",          null: false
    t.index ["intelligence2_id", "user_id"], name: "intelligence_downvotes_intelligence2_id_307b32d72d631a2e_uniq", unique: true, using: :btree
    t.index ["intelligence2_id"], name: "intelligence_downvotes_intelligence2_id", using: :btree
    t.index ["user_id"], name: "intelligence_downvotes_user_id", using: :btree
  end

  create_table "intelligence_stars", force: :cascade do |t|
    t.integer "intelligence2_id", null: false
    t.integer "user_id",          null: false
    t.index ["intelligence2_id", "user_id"], name: "intelligence_stars_intelligence2_id_4d402af5c2315612_uniq", unique: true, using: :btree
    t.index ["intelligence2_id"], name: "intelligence_stars_intelligence2_id", using: :btree
    t.index ["user_id"], name: "intelligence_stars_user_id", using: :btree
  end

  create_table "intelligence_update_serial", id: false, force: :cascade do |t|
    t.bigint "update_serial"
  end

  create_table "intelligence_upvotes", force: :cascade do |t|
    t.integer "intelligence2_id", null: false
    t.integer "user_id",          null: false
    t.index ["intelligence2_id", "user_id"], name: "intelligence_upvotes_intelligence2_id_6aeb97fa4b0bdbf_uniq", unique: true, using: :btree
    t.index ["intelligence2_id"], name: "intelligence_upvotes_intelligence2_id", using: :btree
    t.index ["user_id"], name: "intelligence_upvotes_user_id", using: :btree
  end

  create_table "intelligence_watching", force: :cascade do |t|
    t.integer "intelligence2_id", null: false
    t.integer "user_id",          null: false
    t.index ["intelligence2_id", "user_id"], name: "intelligence_watching_intelligence2_id_60f58a518f5af091_uniq", unique: true, using: :btree
    t.index ["intelligence2_id"], name: "intelligence_watching_intelligence2_id", using: :btree
    t.index ["user_id"], name: "intelligence_watching_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "registration_registrationprofile", force: :cascade do |t|
    t.integer "user_id",                   null: false
    t.string  "activation_key", limit: 40, null: false
    t.index ["user_id"], name: "registration_registrationprofile_user_id_key", unique: true, using: :btree
  end

  create_table "retina_features", force: :cascade do |t|
    t.string  "domain",                  limit: 255, null: false
    t.string  "classification",          limit: 10,  null: false
    t.float   "prob_benign",                         null: false
    t.float   "prob_hacked",                         null: false
    t.float   "prob_malicious",                      null: false
    t.float   "entropy",                             null: false
    t.float   "age",                                 null: false
    t.float   "dns_ttl",                             null: false
    t.bigint  "ip_num",                              null: false
    t.float   "lat",                                 null: false
    t.float   "lon",                                 null: false
    t.boolean "gsb",                                 null: false
    t.float   "wot_trust_score",                     null: false
    t.float   "wot_trust_confidence",                null: false
    t.float   "wot_safety_score",                    null: false
    t.float   "wot_safety_confidence",               null: false
    t.float   "wot_categories_score",                null: false
    t.integer "vt_detect_urls",                      null: false
    t.integer "vt_detect_downloads",                 null: false
    t.integer "vt_detect_communicating",             null: false
    t.boolean "bitdefender",                         null: false
    t.boolean "drweb",                               null: false
    t.boolean "webutation",                          null: false
    t.float   "webutation_score",                    null: false
    t.boolean "malwarebytes",                        null: false
    t.boolean "opera",                               null: false
    t.integer "urlvoid_detections",                  null: false
    t.boolean "dyndns",                              null: false
    t.boolean "sinkhole_ip",                         null: false
    t.boolean "sinkhole_nameserver",                 null: false
    t.index "domain varchar_pattern_ops", name: "retina_features_domain_like", using: :btree
    t.index ["domain"], name: "retina_features_domain_key", unique: true, using: :btree
  end

  create_table "signup_registration", force: :cascade do |t|
    t.string   "email",              limit: 75,  null: false
    t.string   "name",               limit: 140, null: false
    t.string   "organization",       limit: 100, null: false
    t.string   "phone",              limit: 25,  null: false
    t.string   "password",           limit: 400, null: false
    t.boolean  "confirmed",                      null: false
    t.boolean  "authorized",                     null: false
    t.string   "reghash",            limit: 40,  null: false
    t.string   "source",             limit: 15,  null: false
    t.string   "ip",                 limit: 20,  null: false
    t.datetime "created_ts",                     null: false
    t.integer  "authorized_by_id"
    t.datetime "authorized_ts"
    t.datetime "modified_ts",                    null: false
    t.string   "username",           limit: 75,  null: false
    t.boolean  "org_admin",                      null: false
    t.string   "country",            limit: 2
    t.string   "state",              limit: 2
    t.boolean  "is_partner_request",             null: false
    t.string   "industry",           limit: 100
    t.string   "postal_code",        limit: 25
    t.index "email varchar_pattern_ops", name: "signup_registration_email_like", using: :btree
    t.index "username varchar_pattern_ops", name: "signup_registration_username_like", using: :btree
    t.index ["authorized_by_id"], name: "signup_registration_authorized_by_id", using: :btree
    t.index ["email"], name: "signup_registration_email_key", unique: true, using: :btree
    t.index ["username"], name: "signup_registration_username_key", unique: true, using: :btree
  end

  create_table "south_migrationhistory", force: :cascade do |t|
    t.string   "app_name",  limit: 255, null: false
    t.string   "migration", limit: 255, null: false
    t.datetime "applied",               null: false
  end

  create_table "sync_tracker", force: :cascade do |t|
    t.string   "name",        limit: 64,              null: false
    t.bigint   "last_id",                default: -1, null: false
    t.datetime "created_ts",                          null: false
    t.datetime "modified_ts"
    t.index "name varchar_pattern_ops", name: "sync_tracker_name_like", using: :btree
    t.index ["name"], name: "sync_tracker_name_key", unique: true, using: :btree
  end

  create_table "tastypie_apiaccess", force: :cascade do |t|
    t.string  "identifier",     limit: 255, null: false
    t.string  "url",            limit: 255, null: false
    t.string  "request_method", limit: 10,  null: false
    t.integer "accessed",                   null: false
  end

  create_table "tastypie_apikey", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.string   "key",     limit: 256, null: false
    t.datetime "created",             null: false
    t.index ["key"], name: "tastypie_apikey_key", using: :btree
    t.index ["user_id"], name: "tastypie_apikey_user_id_key", unique: true, using: :btree
  end

  create_table "trustedcircles_trustedcircle", force: :cascade do |t|
    t.string  "name",                   limit: 100, null: false
    t.boolean "public",                             null: false
    t.boolean "openinvite",                         null: false
    t.string  "description",            limit: 255, null: false
    t.boolean "restricted_publishing",              null: false
    t.integer "premium_channel_id"
    t.boolean "validate_subscriptions",             null: false
    t.index ["name"], name: "trustedcircles_trustedcircle_name_uniq", unique: true, using: :btree
    t.index ["premium_channel_id"], name: "trustedcircles_trustedcircle_premium_channel_id", using: :btree
  end

  create_table "trustedcircles_trustedcircle_admins", force: :cascade do |t|
    t.integer  "trustedcircle_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_ts",       null: false
    t.datetime "modified_ts",      null: false
    t.boolean  "alive"
    t.index ["trustedcircle_id", "user_id", "alive"], name: "trustedcircles_trustedci_trustedcircle_id_7df392f10809f0a8_uniq", unique: true, using: :btree
    t.index ["trustedcircle_id"], name: "trustedcircles_trustedcircle_admins_trustedcircle_id", using: :btree
    t.index ["user_id"], name: "trustedcircles_trustedcircle_admins_user_id", using: :btree
  end

  create_table "trustedcircles_trustedcircle_members", force: :cascade do |t|
    t.integer  "trustedcircle_id",               null: false
    t.integer  "userorganization_id",            null: false
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.boolean  "alive"
    t.integer  "approved_by_id"
    t.string   "membership_type",     limit: 25
    t.index ["approved_by_id"], name: "trustedcircles_trustedcircle_members_approved_by_id", using: :btree
    t.index ["trustedcircle_id", "userorganization_id", "alive"], name: "trustedcircles_trustedci_trustedcircle_id_44d0f8b3c8270787_uniq", unique: true, using: :btree
    t.index ["trustedcircle_id"], name: "trustedcircles_trustedcircle_members_trustedcircle_id", using: :btree
    t.index ["userorganization_id"], name: "trustedcircles_trustedcircle_members_userorganization_id", using: :btree
  end

  create_table "trustedcircles_trustedcircleinvite", force: :cascade do |t|
    t.integer  "circle_id",                    null: false
    t.integer  "inviter_id",                   null: false
    t.boolean  "as_admin",                     null: false
    t.datetime "accept_timestamp"
    t.datetime "invite_timestamp",             null: false
    t.string   "invitee_email",    limit: 254, null: false
    t.string   "token",            limit: 255, null: false
    t.integer  "status",                       null: false
    t.index ["circle_id"], name: "trustedcircles_trustedcircleinvite_circle_id", using: :btree
    t.index ["inviter_id"], name: "trustedcircles_trustedcircleinvite_inviter_id", using: :btree
    t.index ["token"], name: "trustedcircles_trustedcircleinvite_token_uniq", unique: true, using: :btree
  end

  create_table "tsdb_activitydaterange", force: :cascade do |t|
    t.datetime "start_ts",    null: false
    t.datetime "end_ts",      null: false
    t.integer  "campaign_id"
    t.integer  "incident_id"
    t.index ["campaign_id"], name: "tsdb_activitydaterange_campaign_id", using: :btree
    t.index ["incident_id"], name: "tsdb_activitydaterange_incident_id", using: :btree
  end

  create_table "tsdb_actor", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.text     "description"
    t.string   "avatar_s3_url",      limit: 255
    t.boolean  "is_public",                      null: false
    t.integer  "organization_id",                null: false
    t.boolean  "is_team",                        null: false
    t.integer  "soph_type_id"
    t.text     "soph_desc"
    t.string   "tlp",                limit: 255
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.text     "tags",                                        array: true
    t.datetime "start_date"
    t.string   "publication_status", limit: 30,  null: false
    t.boolean  "is_cloneable",                   null: false
    t.integer  "parent_id"
    t.string   "body_content_type",  limit: 10
    t.bigint   "feed_id",                        null: false
    t.index ["name", "organization_id"], name: "tsdb_actor_name_6c8166cdd2fa1cc_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_actor_organization_id", using: :btree
    t.index ["parent_id"], name: "tsdb_actor_parent_id", using: :btree
    t.index ["soph_type_id"], name: "tsdb_actor_soph_type_id", using: :btree
  end

  create_table "tsdb_actor_circles", force: :cascade do |t|
    t.integer "actor_id",         null: false
    t.integer "trustedcircle_id", null: false
    t.index ["actor_id", "trustedcircle_id"], name: "tsdb_actor_circles_actor_id_4c9559762bb36035_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_circles_actor_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_actor_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_actor_downvotes", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "user_id",  null: false
    t.index ["actor_id", "user_id"], name: "tsdb_actor_downvotes_actor_id_7b9b8b9dab3146dc_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_downvotes_actor_id", using: :btree
    t.index ["user_id"], name: "tsdb_actor_downvotes_user_id", using: :btree
  end

  create_table "tsdb_actor_intelligence", force: :cascade do |t|
    t.integer "actor_id",         null: false
    t.integer "intelligence2_id", null: false
    t.index ["actor_id", "intelligence2_id"], name: "tsdb_actor_intelligence_actor_id_7312ff3cede7ac14_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_intelligence_actor_id", using: :btree
    t.index ["intelligence2_id"], name: "tsdb_actor_intelligence_intelligence2_id", using: :btree
  end

  create_table "tsdb_actor_signatures", force: :cascade do |t|
    t.integer "actor_id",     null: false
    t.integer "signature_id", null: false
    t.index ["actor_id", "signature_id"], name: "tsdb_actor_signatures_actor_id_488ebe18c2817e9f_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_signatures_actor_id", using: :btree
    t.index ["signature_id"], name: "tsdb_actor_signatures_signature_id", using: :btree
  end

  create_table "tsdb_actor_stars", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "user_id",  null: false
    t.index ["actor_id", "user_id"], name: "tsdb_actor_stars_actor_id_3515dbb1ef60819c_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_stars_actor_id", using: :btree
    t.index ["user_id"], name: "tsdb_actor_stars_user_id", using: :btree
  end

  create_table "tsdb_actor_upvotes", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "user_id",  null: false
    t.index ["actor_id", "user_id"], name: "tsdb_actor_upvotes_actor_id_446b7a6b98ec1659_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_upvotes_actor_id", using: :btree
    t.index ["user_id"], name: "tsdb_actor_upvotes_user_id", using: :btree
  end

  create_table "tsdb_actor_victims", force: :cascade do |t|
    t.integer "actor_id",      null: false
    t.integer "victimtype_id", null: false
    t.index ["actor_id", "victimtype_id"], name: "tsdb_actor_victims_actor_id_56f903e42a393489_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_victims_actor_id", using: :btree
    t.index ["victimtype_id"], name: "tsdb_actor_victims_victimtype_id", using: :btree
  end

  create_table "tsdb_actor_watching", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "user_id",  null: false
    t.index ["actor_id", "user_id"], name: "tsdb_actor_watching_actor_id_7dd88b9e61c07ddf_uniq", unique: true, using: :btree
    t.index ["actor_id"], name: "tsdb_actor_watching_actor_id", using: :btree
    t.index ["user_id"], name: "tsdb_actor_watching_user_id", using: :btree
  end

  create_table "tsdb_actoralias", force: :cascade do |t|
    t.string  "name",     limit: 100, null: false
    t.integer "actor_id"
    t.index ["actor_id"], name: "tsdb_actoralias_actor_id", using: :btree
    t.index ["name", "actor_id"], name: "tsdb_actoralias_name_4ae55b6e096bd514_uniq", unique: true, using: :btree
  end

  create_table "tsdb_actormotivation", force: :cascade do |t|
    t.integer "m_type_id",   null: false
    t.text    "description"
    t.integer "actor_id"
    t.index ["actor_id"], name: "tsdb_actormotivation_actor_id", using: :btree
    t.index ["m_type_id", "actor_id"], name: "tsdb_actormotivation_m_type_id_45c9af4ea098ae45_uniq", unique: true, using: :btree
    t.index ["m_type_id"], name: "tsdb_actormotivation_m_type_id", using: :btree
  end

  create_table "tsdb_actormotivationtype", force: :cascade do |t|
    t.integer "value",                    null: false
    t.string  "display_name", limit: 255, null: false
  end

  create_table "tsdb_actorsophisticationtype", force: :cascade do |t|
    t.string "value",        limit: 1,   null: false
    t.string "display_name", limit: 255, null: false
  end

  create_table "tsdb_actortracking", force: :cascade do |t|
    t.string  "t_type",   limit: 1,   null: false
    t.string  "value",    limit: 100, null: false
    t.integer "actor_id"
    t.index ["actor_id"], name: "tsdb_actortracking_actor_id", using: :btree
    t.index ["value", "actor_id"], name: "tsdb_actortracking_value_38ffc21c299df6ad_uniq", unique: true, using: :btree
  end

  create_table "tsdb_actortype", force: :cascade do |t|
    t.integer "value",                    null: false
    t.string  "display_name", limit: 255, null: false
  end

  create_table "tsdb_actortypestatement", force: :cascade do |t|
    t.integer "a_type_id",   null: false
    t.text    "description"
    t.integer "actor_id"
    t.index ["a_type_id", "actor_id"], name: "tsdb_actortypestatement_a_type_id_4e647908381e613b_uniq", unique: true, using: :btree
    t.index ["a_type_id"], name: "tsdb_actortypestatement_a_type_id", using: :btree
    t.index ["actor_id"], name: "tsdb_actortypestatement_actor_id", using: :btree
  end

  create_table "tsdb_anomalilink", force: :cascade do |t|
    t.string   "link_type",    limit: 20,  null: false
    t.string   "os",           limit: 20,  null: false
    t.string   "os_version",   limit: 20,  null: false
    t.string   "arch",         limit: 10,  null: false
    t.string   "sha256",       limit: 64,  null: false
    t.string   "link_version", limit: 10,  null: false
    t.string   "path",         limit: 100, null: false
    t.datetime "created_ts",               null: false
    t.boolean  "is_public",                null: false
  end

  create_table "tsdb_anomalilink_organizations", force: :cascade do |t|
    t.integer "anomalilink_id",      null: false
    t.integer "userorganization_id", null: false
    t.index ["anomalilink_id", "userorganization_id"], name: "tsdb_anomalilink_organization_anomalilink_id_userorganizati_key", unique: true, using: :btree
    t.index ["anomalilink_id"], name: "tsdb_anomalilink_organizations_anomalilink_id", using: :btree
    t.index ["userorganization_id"], name: "tsdb_anomalilink_organizations_userorganization_id", using: :btree
  end

  create_table "tsdb_anomalilinkprofile", force: :cascade do |t|
    t.string   "name",              limit: 50
    t.string   "link_type",         limit: 20,   null: false
    t.string   "link_version",      limit: 10,   null: false
    t.integer  "user_id",                        null: false
    t.string   "os",                limit: 20
    t.string   "os_version",        limit: 20
    t.string   "arch",              limit: 10
    t.boolean  "auto_update",                    null: false
    t.boolean  "is_service",                     null: false
    t.integer  "frequency_seconds",              null: false
    t.json     "source"
    t.string   "filter",            limit: 4096
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.index ["user_id"], name: "tsdb_anomalilinkprofile_user_id", using: :btree
  end

  create_table "tsdb_asyncreport", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.datetime "created_ts",              null: false
    t.datetime "modified_ts",             null: false
    t.string   "s3_url",      limit: 500
    t.string   "printable",   limit: 500
    t.string   "report_type", limit: 50
    t.boolean  "succeed"
    t.index ["user_id"], name: "tsdb_asyncreport_user_id", using: :btree
  end

  create_table "tsdb_behaviorattackpattern", force: :cascade do |t|
    t.string  "name",   limit: 100, null: false
    t.text    "notes"
    t.integer "ttp_id"
    t.index ["name", "ttp_id"], name: "tsdb_behaviorattackpattern_name_23e36eebc8c8530d_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_behaviorattackpattern_ttp_id", using: :btree
  end

  create_table "tsdb_behaviorexploit", force: :cascade do |t|
    t.string  "name",   limit: 100, null: false
    t.text    "notes"
    t.integer "ttp_id"
    t.index ["name", "ttp_id"], name: "tsdb_behaviorexploit_name_76c36e3d8c3af994_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_behaviorexploit_ttp_id", using: :btree
  end

  create_table "tsdb_behaviormalware", force: :cascade do |t|
    t.string  "name",      limit: 100, null: false
    t.integer "m_type_id",             null: false
    t.text    "notes"
    t.integer "ttp_id"
    t.index ["m_type_id"], name: "tsdb_behaviormalware_m_type_id", using: :btree
    t.index ["name", "ttp_id"], name: "tsdb_behaviormalware_name_445dcb682c077e98_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_behaviormalware_ttp_id", using: :btree
  end

  create_table "tsdb_campaign", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.text     "description"
    t.boolean  "is_public",                      null: false
    t.integer  "organization_id",                null: false
    t.integer  "status_id"
    t.string   "tlp",                limit: 255
    t.text     "tags",                                        array: true
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.string   "publication_status", limit: 30,  null: false
    t.boolean  "is_cloneable",                   null: false
    t.integer  "parent_id"
    t.string   "body_content_type",  limit: 10
    t.bigint   "feed_id",                        null: false
    t.index ["name", "organization_id"], name: "tsdb_campaign_name_38ff08c9731d9b56_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_campaign_organization_id", using: :btree
    t.index ["parent_id"], name: "tsdb_campaign_parent_id", using: :btree
    t.index ["status_id"], name: "tsdb_campaign_status_id", using: :btree
  end

  create_table "tsdb_campaign_actors", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "actor_id",    null: false
    t.index ["actor_id"], name: "tsdb_campaign_actors_actor_id", using: :btree
    t.index ["campaign_id", "actor_id"], name: "tsdb_campaign_actors_campaign_id_63216bdf51c0ddfd_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_actors_campaign_id", using: :btree
  end

  create_table "tsdb_campaign_circles", force: :cascade do |t|
    t.integer "campaign_id",      null: false
    t.integer "trustedcircle_id", null: false
    t.index ["campaign_id", "trustedcircle_id"], name: "tsdb_campaign_circles_campaign_id_fead279a0646f2d_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_circles_campaign_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_campaign_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_campaign_downvotes", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "user_id",     null: false
    t.index ["campaign_id", "user_id"], name: "tsdb_campaign_downvotes_campaign_id_1441bc6b053bc54a_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_downvotes_campaign_id", using: :btree
    t.index ["user_id"], name: "tsdb_campaign_downvotes_user_id", using: :btree
  end

  create_table "tsdb_campaign_incidents", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "incident_id", null: false
    t.index ["campaign_id", "incident_id"], name: "tsdb_campaign_incidents_campaign_id_37940e6177aedd41_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_incidents_campaign_id", using: :btree
    t.index ["incident_id"], name: "tsdb_campaign_incidents_incident_id", using: :btree
  end

  create_table "tsdb_campaign_intelligence", force: :cascade do |t|
    t.integer "campaign_id",      null: false
    t.integer "intelligence2_id", null: false
    t.index ["campaign_id", "intelligence2_id"], name: "tsdb_campaign_intelligence_campaign_id_69a69e53d2f98156_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_intelligence_campaign_id", using: :btree
    t.index ["intelligence2_id"], name: "tsdb_campaign_intelligence_intelligence2_id", using: :btree
  end

  create_table "tsdb_campaign_signatures", force: :cascade do |t|
    t.integer "campaign_id",  null: false
    t.integer "signature_id", null: false
    t.index ["campaign_id", "signature_id"], name: "tsdb_campaign_signatures_campaign_id_5ccacf949a61bed9_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_signatures_campaign_id", using: :btree
    t.index ["signature_id"], name: "tsdb_campaign_signatures_signature_id", using: :btree
  end

  create_table "tsdb_campaign_stars", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "user_id",     null: false
    t.index ["campaign_id", "user_id"], name: "tsdb_campaign_stars_campaign_id_c32d6069fccac82_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_stars_campaign_id", using: :btree
    t.index ["user_id"], name: "tsdb_campaign_stars_user_id", using: :btree
  end

  create_table "tsdb_campaign_ttps", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "ttp_id",      null: false
    t.index ["campaign_id", "ttp_id"], name: "tsdb_campaign_ttps_campaign_id_5e5a0b85f4cb9f93_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_ttps_campaign_id", using: :btree
    t.index ["ttp_id"], name: "tsdb_campaign_ttps_ttp_id", using: :btree
  end

  create_table "tsdb_campaign_upvotes", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "user_id",     null: false
    t.index ["campaign_id", "user_id"], name: "tsdb_campaign_upvotes_campaign_id_65ef80c4373da867_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_upvotes_campaign_id", using: :btree
    t.index ["user_id"], name: "tsdb_campaign_upvotes_user_id", using: :btree
  end

  create_table "tsdb_campaign_victims", force: :cascade do |t|
    t.integer "campaign_id",   null: false
    t.integer "victimtype_id", null: false
    t.index ["campaign_id", "victimtype_id"], name: "tsdb_campaign_victims_campaign_id_71259ebf7fc82055_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_victims_campaign_id", using: :btree
    t.index ["victimtype_id"], name: "tsdb_campaign_victims_victimtype_id", using: :btree
  end

  create_table "tsdb_campaign_watching", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "user_id",     null: false
    t.index ["campaign_id", "user_id"], name: "tsdb_campaign_watching_campaign_id_65bd8fdb654a5409_uniq", unique: true, using: :btree
    t.index ["campaign_id"], name: "tsdb_campaign_watching_campaign_id", using: :btree
    t.index ["user_id"], name: "tsdb_campaign_watching_user_id", using: :btree
  end

  create_table "tsdb_campaignalias", force: :cascade do |t|
    t.string  "name",        limit: 100, null: false
    t.integer "campaign_id"
    t.index ["campaign_id"], name: "tsdb_campaignalias_campaign_id", using: :btree
    t.index ["name", "campaign_id"], name: "tsdb_campaignalias_name_233ede46a3199eca_uniq", unique: true, using: :btree
  end

  create_table "tsdb_campaignstatus", force: :cascade do |t|
    t.string "display_name", limit: 50, null: false
  end

  create_table "tsdb_comment", force: :cascade do |t|
    t.text     "comment",    null: false
    t.datetime "created_ts", null: false
    t.integer  "user_id",    null: false
    t.inet     "ip_address"
    t.index ["user_id"], name: "tsdb_comment_user_id", using: :btree
  end

  create_table "tsdb_comment_intelligences", force: :cascade do |t|
    t.integer "comment_id",       null: false
    t.bigint  "intelligence2_id", null: false
    t.index ["comment_id", "intelligence2_id"], name: "tsdb_comment_intelligences_comment_id_70816a8bd55897b6_uniq", unique: true, using: :btree
    t.index ["comment_id"], name: "tsdb_comment_intelligences_comment_id", using: :btree
    t.index ["intelligence2_id"], name: "tsdb_comment_intelligences_intelligence2_id", using: :btree
  end

  create_table "tsdb_confidencecomparison", force: :cascade do |t|
    t.string   "value",             limit: 2048, null: false
    t.string   "type",              limit: 10,   null: false
    t.integer  "retina_confidence",              null: false
    t.integer  "macula_confidence",              null: false
    t.datetime "created_ts",                     null: false
    t.index "type varchar_pattern_ops", name: "tsdb_confidencecomparison_type_like", using: :btree
    t.index "value varchar_pattern_ops", name: "tsdb_confidencecomparison_value_like", using: :btree
    t.index ["type"], name: "tsdb_confidencecomparison_type", using: :btree
    t.index ["value"], name: "tsdb_confidencecomparison_value", using: :btree
  end

  create_table "tsdb_content", force: :cascade do |t|
    t.string   "name",            limit: 100, null: false
    t.text     "xml",                         null: false
    t.string   "version",         limit: 100, null: false
    t.string   "product",         limit: 50,  null: false
    t.string   "product_version", limit: 50,  null: false
    t.datetime "timestamp",                   null: false
  end

  create_table "tsdb_controlledaccessintegration", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.text     "public_ip_addresses",              array: true
    t.text     "notes"
    t.boolean  "is_active",           null: false
    t.datetime "created_ts",          null: false
    t.datetime "modified_ts",         null: false
    t.index ["user_id"], name: "tsdb_controlledaccessintegration_user_id_key", unique: true, using: :btree
  end

  create_table "tsdb_coupon", force: :cascade do |t|
    t.string   "code",             limit: 256, null: false
    t.integer  "discount_cents",               null: false
    t.integer  "discount_percent",             null: false
    t.datetime "expire_ts"
    t.integer  "organization_id"
    t.boolean  "one_time",                     null: false
    t.index "code varchar_pattern_ops", name: "tsdb_coupon_code_like", using: :btree
    t.index ["code"], name: "tsdb_coupon_code_key", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_coupon_organization_id", using: :btree
  end

  create_table "tsdb_cuckooreportfile", force: :cascade do |t|
    t.integer "submit_id",             null: false
    t.string  "path",      limit: 255, null: false
    t.string  "s3_url",    limit: 255, null: false
    t.index ["submit_id", "path"], name: "tsdb_cuckooreportfile_unique_idx", unique: true, using: :btree
    t.index ["submit_id"], name: "tsdb_cuckooreportfile_submit_id", using: :btree
  end

  create_table "tsdb_cve", force: :cascade do |t|
    t.string  "cve_id",                 limit: 255, null: false
    t.float   "score",                              null: false
    t.string  "access_vector",          limit: 255, null: false
    t.string  "access_complexity",      limit: 255, null: false
    t.string  "authentication",         limit: 255, null: false
    t.string  "confidentiality_impact", limit: 255, null: false
    t.string  "integrity_impact",       limit: 255, null: false
    t.string  "availability_impact",    limit: 255, null: false
    t.string  "summary",                limit: 255, null: false
    t.integer "exploitable",                        null: false
    t.string  "exploit_url",            limit: 255, null: false
    t.index "cve_id varchar_pattern_ops", name: "tsdb_cve_cve_id_like", using: :btree
    t.index ["cve_id"], name: "tsdb_cve_cve_id_key", unique: true, using: :btree
  end

  create_table "tsdb_dashboard", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.datetime "created_ts",              null: false
    t.datetime "modified_ts",             null: false
    t.boolean  "is_active",               null: false
    t.integer  "num_rows",                null: false
    t.integer  "num_cols",                null: false
    t.integer  "org_id"
    t.index "title varchar_pattern_ops", name: "tsdb_dashboard_title_like", using: :btree
    t.index ["org_id"], name: "tsdb_dashboard_org_id", using: :btree
    t.index ["title"], name: "tsdb_dashboard_title_key", unique: true, using: :btree
    t.index ["title"], name: "tsdb_dashboard_title_uniq", unique: true, using: :btree
  end

  create_table "tsdb_dashboardreportconfiguration", force: :cascade do |t|
    t.integer  "dashboard_id",            null: false
    t.integer  "report_configuration_id", null: false
    t.integer  "row",                     null: false
    t.integer  "col",                     null: false
    t.datetime "created_ts",              null: false
    t.datetime "modified_ts",             null: false
    t.integer  "width",                   null: false
    t.integer  "height",                  null: false
    t.index ["dashboard_id", "row", "col"], name: "tsdb_dashboardreportconfigur_dashboard_id_7e7ce646ff0c1860_uniq", unique: true, using: :btree
    t.index ["dashboard_id"], name: "tsdb_dashboardreportconfiguration_dashboard_id", using: :btree
    t.index ["report_configuration_id"], name: "tsdb_dashboardreportconfiguration_report_configuration_id", using: :btree
  end

  create_table "tsdb_datacollectorstatus", force: :cascade do |t|
    t.integer  "org_id",        null: false
    t.datetime "collection_ts", null: false
    t.datetime "created_ts",    null: false
    t.bigint   "bytes",         null: false
    t.index ["org_id"], name: "tsdb_datacollectorstatus_org_id", using: :btree
  end

  create_table "tsdb_defaulttemplate", force: :cascade do |t|
    t.integer "model_id",        null: false
    t.integer "template_id",     null: false
    t.integer "organization_id", null: false
    t.index ["model_id", "template_id", "organization_id"], name: "tsdb_defaulttemplate_model_id_c607261c738fa06_uniq", unique: true, using: :btree
    t.index ["model_id"], name: "tsdb_defaulttemplate_model_id", using: :btree
    t.index ["organization_id"], name: "tsdb_defaulttemplate_organization_id", using: :btree
    t.index ["template_id"], name: "tsdb_defaulttemplate_template_id", using: :btree
  end

  create_table "tsdb_exportfileasync", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.string   "resource_name", limit: 30,  null: false
    t.integer  "resource_id"
    t.string   "status",        limit: 30
    t.datetime "created_ts",                null: false
    t.datetime "modified_ts",               null: false
    t.datetime "processed_ts"
    t.string   "s3_file_url",   limit: 255
    t.string   "filename",      limit: 255
    t.string   "messages",      limit: 255
    t.index ["user_id"], name: "tsdb_exportfileasync_user_id", using: :btree
  end

  create_table "tsdb_exportstixdata", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.string   "resource_name", limit: 30,  null: false
    t.integer  "resource_id",               null: false
    t.string   "status",        limit: 30
    t.datetime "created_ts",                null: false
    t.datetime "modified_ts",               null: false
    t.datetime "processed_ts"
    t.string   "s3_file_url",   limit: 255
    t.string   "filename",      limit: 255
    t.string   "messages",      limit: 255
    t.index ["user_id"], name: "tsdb_exportstixdata_user_id", using: :btree
  end

  create_table "tsdb_externalsubscription", force: :cascade do |t|
    t.string   "name",        limit: 256,  null: false
    t.text     "description"
    t.string   "url",         limit: 1024
    t.string   "validity",    limit: 20,   null: false
    t.datetime "created_ts",               null: false
    t.boolean  "is_trial",                 null: false
    t.index ["name", "validity"], name: "tsdb_externalsubscription_name_3242150df7fd2700_uniq", unique: true, using: :btree
  end

  create_table "tsdb_falsepos", force: :cascade do |t|
    t.text     "comment",                    null: false
    t.datetime "timestamp",                  null: false
    t.integer  "username_id",                null: false
    t.bigint   "intelligence_id",            null: false
    t.string   "state",           limit: 10, null: false
    t.datetime "modified_ts",                null: false
    t.integer  "count",                      null: false
    t.text     "reason"
    t.json     "history",                    null: false
    t.index ["intelligence_id"], name: "tsdb_falsepos_intelligence_id", using: :btree
    t.index ["intelligence_id"], name: "tsdb_falsepos_intelligence_id_uniq", unique: true, using: :btree
    t.index ["modified_ts"], name: "tsdb_falsepos_modified_ts", using: :btree
    t.index ["state"], name: "tsdb_falsepos_state", using: :btree
    t.index ["timestamp"], name: "tsdb_falsepos_timestamp", using: :btree
    t.index ["username_id"], name: "tsdb_falsepos_username_id", using: :btree
  end

  create_table "tsdb_feedgroup", force: :cascade do |t|
    t.string "name",        limit: 60, null: false
    t.text   "description",            null: false
    t.string "validity",    limit: 20, null: false
    t.index "description text_pattern_ops", name: "tsdb_feedgroup_description_like", using: :btree
    t.index "name varchar_pattern_ops", name: "tsdb_feedgroup_name_like", using: :btree
    t.index ["description"], name: "tsdb_feedgroup_description", using: :btree
  end

  create_table "tsdb_feedgroup_feeds", force: :cascade do |t|
    t.integer "feedgroup_id", null: false
    t.integer "feeds_id",     null: false
    t.index ["feedgroup_id", "feeds_id"], name: "tsdb_feedgroup_feeds_feedgroup_id_167d4c9b3cb7d57_uniq", unique: true, using: :btree
    t.index ["feedgroup_id"], name: "tsdb_feedgroup_feeds_feedgroup_id", using: :btree
    t.index ["feeds_id"], name: "tsdb_feedgroup_feeds_feeds_id", using: :btree
  end

  create_table "tsdb_feedgroupsubscription", force: :cascade do |t|
    t.integer  "org_id",        null: false
    t.integer  "feed_group_id", null: false
    t.datetime "created_ts",    null: false
    t.datetime "modified_ts",   null: false
    t.boolean  "alive",         null: false
    t.index ["feed_group_id"], name: "tsdb_feedgroupsubscription_feed_group_id", using: :btree
    t.index ["org_id", "feed_group_id"], name: "tsdb_feedgroupsubscription_org_id_657555264211868d_uniq", unique: true, using: :btree
    t.index ["org_id"], name: "tsdb_feedgroupsubscription_org_id", using: :btree
  end

  create_table "tsdb_feeds", force: :cascade do |t|
    t.string   "name",                     limit: 120,  null: false
    t.string   "url",                      limit: 512,  null: false
    t.string   "itype",                    limit: 120,  null: false
    t.string   "regex",                    limit: 550,  null: false
    t.string   "fields",                   limit: 250,  null: false
    t.string   "regex_filter",             limit: 250,  null: false
    t.string   "confidence",               limit: 100,  null: false
    t.string   "severity",                 limit: 100,  null: false
    t.text     "notes",                                 null: false
    t.string   "id_regex",                 limit: 250,  null: false
    t.string   "child_page_url_template",  limit: 250,  null: false
    t.string   "fields_mapping",           limit: 250,  null: false
    t.string   "post_data",                limit: 250,  null: false
    t.integer  "state",                                 null: false
    t.integer  "sleep_time",                            null: false
    t.string   "interval",                 limit: 20
    t.boolean  "active",                                null: false
    t.datetime "last_updated"
    t.integer  "reported_by_user_id"
    t.string   "classification",           limit: 100
    t.string   "engine",                   limit: 100
    t.string   "imap_host",                limit: 120,  null: false
    t.string   "imap_port",                limit: 120,  null: false
    t.string   "imap_user",                limit: 120,  null: false
    t.string   "imap_password",            limit: 120,  null: false
    t.string   "imap_subject_regexp",      limit: 120,  null: false
    t.string   "feed_category",            limit: 100
    t.string   "description",              limit: 200,  null: false
    t.boolean  "hidden",                                null: false
    t.boolean  "use_proxy",                             null: false
    t.datetime "last_scraped"
    t.datetime "last_imported"
    t.json     "config",                                null: false
    t.integer  "source_confidence_weight",              null: false
    t.integer  "expiry_time_in_days",                   null: false
    t.boolean  "should_reactivate_intel",               null: false
    t.boolean  "allow_unresolved_domains",              null: false
    t.integer  "organization_id"
    t.string   "reference_url",            limit: 1024
    t.string   "feed_type",                limit: 25,   null: false
    t.index ["classification"], name: "tsdb_feeds_classification", using: :btree
    t.index ["description"], name: "tsdb_feeds_description", using: :btree
    t.index ["name"], name: "tsdb_feeds_name", using: :btree
    t.index ["notes"], name: "tsdb_feeds_notes", using: :btree
    t.index ["organization_id"], name: "tsdb_feeds_organization_id", using: :btree
    t.index ["reported_by_user_id"], name: "tsdb_feeds_reported_by_user_id", using: :btree
    t.index ["url"], name: "tsdb_feeds_url", using: :btree
  end

  create_table "tsdb_feeds_circles", force: :cascade do |t|
    t.integer "feeds_id",         null: false
    t.integer "trustedcircle_id", null: false
    t.index ["feeds_id", "trustedcircle_id"], name: "tsdb_feeds_circles_feeds_id_45024acd072d142b_uniq", unique: true, using: :btree
    t.index ["feeds_id"], name: "tsdb_feeds_circles_feeds_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_feeds_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_globalwhitelist", force: :cascade do |t|
    t.string   "value",      limit: 2048, null: false
    t.string   "value_type", limit: 15,   null: false
    t.datetime "created_ts",              null: false
    t.string   "notes",      limit: 125,  null: false
    t.index "value varchar_pattern_ops", name: "tsdb_globalwhitelist_value_like", using: :btree
    t.index "value_type varchar_pattern_ops", name: "tsdb_globalwhitelist_value_type_like", using: :btree
    t.index ["value"], name: "tsdb_globalwhitelist_value", using: :btree
    t.index ["value_type"], name: "tsdb_globalwhitelist_value_type", using: :btree
  end

  create_table "tsdb_identityprovider", force: :cascade do |t|
    t.string  "codename",         limit: 50,  null: false
    t.json    "settings",                     null: false
    t.text    "idp_cert",                     null: false
    t.text    "sp_key",                       null: false
    t.text    "sp_cert",                      null: false
    t.string  "url",              limit: 100, null: false
    t.string  "name",             limit: 100, null: false
    t.json    "attributes_names",             null: false
    t.boolean "is_active",                    null: false
    t.index "codename varchar_pattern_ops", name: "tsdb_identityprovider_codename_like", using: :btree
    t.index "name varchar_pattern_ops", name: "tsdb_identityprovider_name_like", using: :btree
    t.index "url varchar_pattern_ops", name: "tsdb_identityprovider_url_like", using: :btree
    t.index ["codename"], name: "tsdb_identityprovider_codename_key", unique: true, using: :btree
    t.index ["name"], name: "tsdb_identityprovider_name_key", unique: true, using: :btree
    t.index ["url"], name: "tsdb_identityprovider_url_key", unique: true, using: :btree
  end

  create_table "tsdb_impact", force: :cascade do |t|
    t.string  "name",          limit: 120
    t.string  "desc",          limit: 120
    t.string  "slug",          limit: 150
    t.string  "value_type",    limit: 100, null: false
    t.integer "severity",                  null: false
    t.string  "threat_type",   limit: 100, null: false
    t.boolean "never_expires",             null: false
    t.text    "stix_types",                             array: true
    t.boolean "visible_to_ol",             null: false
    t.index "slug varchar_pattern_ops", name: "tsdb_impact_slug_like", using: :btree
    t.index ["slug"], name: "tsdb_impact_slug", using: :btree
  end

  create_table "tsdb_importdata", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status",                   limit: 255, null: false
    t.string   "jobID",                    limit: 255
    t.text     "messages",                             null: false
    t.datetime "date",                                 null: false
    t.datetime "date_modified",                        null: false
    t.integer  "org_id"
    t.text     "notes",                                null: false
    t.string   "fileType",                 limit: 25
    t.integer  "numIndicators"
    t.string   "fileName",                 limit: 255
    t.boolean  "visibleForReview",                     null: false
    t.integer  "sandbox_submit_id"
    t.integer  "numRejected"
    t.integer  "confidence",                           null: false
    t.boolean  "is_public",                            null: false
    t.integer  "source_confidence_weight"
    t.integer  "default_comment_id"
    t.datetime "processed_ts"
    t.json     "tags",                                 null: false
    t.string   "intelligence_source",      limit: 255
    t.integer  "approved_by_id"
    t.integer  "num_private"
    t.integer  "num_public"
    t.index "\"jobID\" varchar_pattern_ops", name: "tsdb_importdata_jobID_like", using: :btree
    t.index "status varchar_pattern_ops", name: "tsdb_importdata_status_like", using: :btree
    t.index ["approved_by_id"], name: "tsdb_importdata_approved_by_id", using: :btree
    t.index ["default_comment_id"], name: "tsdb_importdata_default_comment_id", using: :btree
    t.index ["org_id"], name: "tsdb_importdata_org_id", using: :btree
    t.index ["sandbox_submit_id"], name: "tsdb_importdata_sandbox_submit_id", using: :btree
    t.index ["user_id"], name: "tsdb_importdata_user_id", using: :btree
  end

  create_table "tsdb_importdata_circles", force: :cascade do |t|
    t.integer "importdata_id",    null: false
    t.integer "trustedcircle_id", null: false
    t.index ["importdata_id", "trustedcircle_id"], name: "tsdb_importdata_circles_importdata_id_6d1903a3c49673f9_uniq", unique: true, using: :btree
    t.index ["importdata_id"], name: "tsdb_importdata_circles_importdata_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_importdata_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_importstixdata", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "org_id",                        null: false
    t.string   "status",            limit: 255, null: false
    t.datetime "created_ts",                    null: false
    t.datetime "modified_ts",                   null: false
    t.datetime "processed_ts"
    t.text     "notes",                         null: false
    t.integer  "num_imported"
    t.integer  "num_rejected"
    t.string   "file_name",         limit: 255
    t.boolean  "ready_for_review",              null: false
    t.json     "messages",                      null: false
    t.integer  "import_session_id"
    t.json     "tags",                          null: false
    t.index ["import_session_id"], name: "tsdb_importstixdata_import_session_id", using: :btree
    t.index ["org_id"], name: "tsdb_importstixdata_org_id", using: :btree
    t.index ["user_id"], name: "tsdb_importstixdata_user_id", using: :btree
  end

  create_table "tsdb_incident", force: :cascade do |t|
    t.string   "name",              limit: 255, null: false
    t.text     "description"
    t.boolean  "is_public",                     null: false
    t.integer  "organization_id",               null: false
    t.integer  "status_id"
    t.text     "status_desc"
    t.string   "tlp",               limit: 255
    t.text     "tags",                                       array: true
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_ts",                    null: false
    t.datetime "modified_ts",                   null: false
    t.boolean  "is_cloneable",                  null: false
    t.integer  "parent_id"
    t.string   "body_content_type", limit: 10
    t.bigint   "feed_id",                       null: false
    t.index ["name", "organization_id"], name: "tsdb_incident_name_58e25808e0d77052_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_incident_organization_id", using: :btree
    t.index ["parent_id"], name: "tsdb_incident_parent_id", using: :btree
    t.index ["status_id"], name: "tsdb_incident_status_id", using: :btree
  end

  create_table "tsdb_incident_actors", force: :cascade do |t|
    t.integer "incident_id", null: false
    t.integer "actor_id",    null: false
    t.index ["actor_id"], name: "tsdb_incident_actors_actor_id", using: :btree
    t.index ["incident_id", "actor_id"], name: "tsdb_incident_actors_incident_id_7729c07eae22119d_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_actors_incident_id", using: :btree
  end

  create_table "tsdb_incident_circles", force: :cascade do |t|
    t.integer "incident_id",      null: false
    t.integer "trustedcircle_id", null: false
    t.index ["incident_id", "trustedcircle_id"], name: "tsdb_incident_circles_incident_id_397a0a30df467ae3_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_circles_incident_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_incident_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_incident_downvotes", force: :cascade do |t|
    t.integer "incident_id", null: false
    t.integer "user_id",     null: false
    t.index ["incident_id", "user_id"], name: "tsdb_incident_downvotes_incident_id_62e360b9d602bd2_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_downvotes_incident_id", using: :btree
    t.index ["user_id"], name: "tsdb_incident_downvotes_user_id", using: :btree
  end

  create_table "tsdb_incident_intelligence", force: :cascade do |t|
    t.integer "incident_id",      null: false
    t.integer "intelligence2_id", null: false
    t.index ["incident_id", "intelligence2_id"], name: "tsdb_incident_intelligence_incident_id_50051d02d19355da_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_intelligence_incident_id", using: :btree
    t.index ["intelligence2_id"], name: "tsdb_incident_intelligence_intelligence2_id", using: :btree
  end

  create_table "tsdb_incident_sandbox_reports", force: :cascade do |t|
    t.integer "incident_id",     null: false
    t.integer "reportedfile_id", null: false
    t.index ["incident_id", "reportedfile_id"], name: "tsdb_incident_sandbox_reports_incident_id_3c0ca061fa4592ec_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_sandbox_reports_incident_id", using: :btree
    t.index ["reportedfile_id"], name: "tsdb_incident_sandbox_reports_reportedfile_id", using: :btree
  end

  create_table "tsdb_incident_signatures", force: :cascade do |t|
    t.integer "incident_id",  null: false
    t.integer "signature_id", null: false
    t.index ["incident_id", "signature_id"], name: "tsdb_incident_signatures_incident_id_74f7baaa01e8e851_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_signatures_incident_id", using: :btree
    t.index ["signature_id"], name: "tsdb_incident_signatures_signature_id", using: :btree
  end

  create_table "tsdb_incident_stars", force: :cascade do |t|
    t.integer "incident_id", null: false
    t.integer "user_id",     null: false
    t.index ["incident_id", "user_id"], name: "tsdb_incident_stars_incident_id_740854287566aa12_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_stars_incident_id", using: :btree
    t.index ["user_id"], name: "tsdb_incident_stars_user_id", using: :btree
  end

  create_table "tsdb_incident_ttps", force: :cascade do |t|
    t.integer "incident_id", null: false
    t.integer "ttp_id",      null: false
    t.index ["incident_id", "ttp_id"], name: "tsdb_incident_ttps_incident_id_8616ce0599f01f3_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_ttps_incident_id", using: :btree
    t.index ["ttp_id"], name: "tsdb_incident_ttps_ttp_id", using: :btree
  end

  create_table "tsdb_incident_upvotes", force: :cascade do |t|
    t.integer "incident_id", null: false
    t.integer "user_id",     null: false
    t.index ["incident_id", "user_id"], name: "tsdb_incident_upvotes_incident_id_1e2acf34be1a7a0f_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_upvotes_incident_id", using: :btree
    t.index ["user_id"], name: "tsdb_incident_upvotes_user_id", using: :btree
  end

  create_table "tsdb_incident_victims", force: :cascade do |t|
    t.integer "incident_id",   null: false
    t.integer "victimtype_id", null: false
    t.index ["incident_id", "victimtype_id"], name: "tsdb_incident_victims_incident_id_6ac15ff8e0d29fd3_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_victims_incident_id", using: :btree
    t.index ["victimtype_id"], name: "tsdb_incident_victims_victimtype_id", using: :btree
  end

  create_table "tsdb_incident_watching", force: :cascade do |t|
    t.integer "incident_id", null: false
    t.integer "user_id",     null: false
    t.index ["incident_id", "user_id"], name: "tsdb_incident_watching_incident_id_1ccc7fc56cb2034f_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incident_watching_incident_id", using: :btree
    t.index ["user_id"], name: "tsdb_incident_watching_user_id", using: :btree
  end

  create_table "tsdb_incidentassignment", force: :cascade do |t|
    t.integer "organization_id",  null: false
    t.integer "assignee_user_id"
    t.integer "incident_id",      null: false
    t.index ["assignee_user_id"], name: "tsdb_incidentassignment_assignee_user_id", using: :btree
    t.index ["incident_id", "organization_id"], name: "tsdb_incidentassignment_incident_id_1c485da09d23879b_uniq", unique: true, using: :btree
    t.index ["incident_id"], name: "tsdb_incidentassignment_incident_id", using: :btree
    t.index ["organization_id"], name: "tsdb_incidentassignment_organization_id", using: :btree
  end

  create_table "tsdb_incidentstatus", force: :cascade do |t|
    t.string "display_name", limit: 50, null: false
  end

  create_table "tsdb_integration", force: :cascade do |t|
    t.string   "name",                  limit: 100, null: false
    t.string   "integration_type",      limit: 25,  null: false
    t.json     "configuration",                     null: false
    t.integer  "owner_organization_id",             null: false
    t.datetime "created_ts",                        null: false
    t.datetime "last_intelligence"
    t.index ["name", "owner_organization_id"], name: "tsdb_integration_name_21d82716a946509_uniq", unique: true, using: :btree
    t.index ["owner_organization_id"], name: "tsdb_integration_owner_organization_id", using: :btree
  end

  create_table "tsdb_intelimportrejection", force: :cascade do |t|
    t.datetime "incident_ts",                                                null: false
    t.string   "raw_data",              limit: 1200,                         null: false
    t.string   "reason",                limit: 100,                          null: false
    t.integer  "user_importer_id",                                           null: false
    t.integer  "owner_organization_id"
    t.string   "type",                  limit: 10,                           null: false
    t.string   "value",                 limit: 2048
    t.bigint   "feed_id",                                                    null: false
    t.string   "country",               limit: 2
    t.decimal  "latitude",                           precision: 9, scale: 6
    t.decimal  "longitude",                          precision: 9, scale: 6
    t.string   "org",                   limit: 50
    t.string   "asn",                   limit: 8
    t.boolean  "is_public",                                                  null: false
    t.integer  "confidence",                                                 null: false
    t.json     "tags"
    t.json     "meta"
    t.integer  "import_session_id"
    t.boolean  "fatal",                                                      null: false
    t.string   "itype",                 limit: 25
    t.string   "ip",                    limit: 45
    t.string   "rdns",                  limit: 253
    t.string   "message",               limit: 2560
    t.index ["import_session_id"], name: "tsdb_intelimportrejection_import_session_id", using: :btree
    t.index ["incident_ts"], name: "tsdb_intelimportrejection_incident_ts", using: :btree
    t.index ["itype"], name: "tsdb_intelimportrejection_itype", using: :btree
    t.index ["owner_organization_id"], name: "tsdb_intelimportrejection_owner_organization_id", using: :btree
    t.index ["type"], name: "tsdb_intelimportrejection_type", using: :btree
    t.index ["user_importer_id"], name: "tsdb_intelimportrejection_user_importer_id", using: :btree
    t.index ["value"], name: "tsdb_intelimportrejection_value", using: :btree
  end

  create_table "tsdb_intelimportrejection_actors", force: :cascade do |t|
    t.integer "intelimportrejection_id", null: false
    t.integer "actor_id",                null: false
    t.index ["actor_id"], name: "tsdb_intelimportrejection_actors_actor_id", using: :btree
    t.index ["intelimportrejection_id", "actor_id"], name: "tsdb_intelimportr_intelimportrejection_id_2d7011e716ac0467_uniq", unique: true, using: :btree
    t.index ["intelimportrejection_id"], name: "tsdb_intelimportrejection_actors_intelimportrejection_id", using: :btree
  end

  create_table "tsdb_intelimportrejection_campaigns", force: :cascade do |t|
    t.integer "intelimportrejection_id", null: false
    t.integer "campaign_id",             null: false
    t.index ["campaign_id"], name: "tsdb_intelimportrejection_campaigns_campaign_id", using: :btree
    t.index ["intelimportrejection_id", "campaign_id"], name: "tsdb_intelimportr_intelimportrejection_id_618f3f2842c64667_uniq", unique: true, using: :btree
    t.index ["intelimportrejection_id"], name: "tsdb_intelimportrejection_campaigns_intelimportrejection_id", using: :btree
  end

  create_table "tsdb_intelimportrejection_incidents", force: :cascade do |t|
    t.integer "intelimportrejection_id", null: false
    t.integer "incident_id",             null: false
    t.index ["incident_id"], name: "tsdb_intelimportrejection_incidents_incident_id", using: :btree
    t.index ["intelimportrejection_id", "incident_id"], name: "tsdb_intelimportr_intelimportrejection_id_314939bb402ada59_uniq", unique: true, using: :btree
    t.index ["intelimportrejection_id"], name: "tsdb_intelimportrejection_incidents_intelimportrejection_id", using: :btree
  end

  create_table "tsdb_intelimportrejection_tip_reports", force: :cascade do |t|
    t.integer "intelimportrejection_id", null: false
    t.integer "tipreport_id",            null: false
    t.index ["intelimportrejection_id", "tipreport_id"], name: "tsdb_intelimportr_intelimportrejection_id_166c1671b588c183_uniq", unique: true, using: :btree
    t.index ["intelimportrejection_id"], name: "tsdb_intelimportrejection_tip_reports_intelimportrejection_id", using: :btree
    t.index ["tipreport_id"], name: "tsdb_intelimportrejection_tip_reports_tipreport_id", using: :btree
  end

  create_table "tsdb_intelimportrejection_ttps", force: :cascade do |t|
    t.integer "intelimportrejection_id", null: false
    t.integer "ttp_id",                  null: false
    t.index ["intelimportrejection_id", "ttp_id"], name: "tsdb_intelimportr_intelimportrejection_id_2360b0bc67cff395_uniq", unique: true, using: :btree
    t.index ["intelimportrejection_id"], name: "tsdb_intelimportrejection_ttps_intelimportrejection_id", using: :btree
    t.index ["ttp_id"], name: "tsdb_intelimportrejection_ttps_ttp_id", using: :btree
  end

# Could not dump table "tsdb_intelligence" because of following NoMethodError
#   undefined method `to_sym' for nil:NilClass

  create_table "tsdb_intelligence_circles", force: :cascade do |t|
    t.integer "intelligence_id",  null: false
    t.integer "trustedcircle_id", null: false
    t.index ["intelligence_id", "trustedcircle_id"], name: "tsdb_intelligence_circles_intelligence_id_1f395489915a7c0f_uniq", unique: true, using: :btree
    t.index ["intelligence_id"], name: "tsdb_intelligence_circles_intelligence_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_intelligence_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_intelligencehistory", force: :cascade do |t|
    t.integer  "intelligence_id",            null: false
    t.integer  "user_id",                    null: false
    t.string   "ctype",           limit: 25
    t.json     "changes",                    null: false
    t.datetime "ts",                         null: false
    t.index ["intelligence_id"], name: "tsdb_intelligencehistory_intelligence_id", using: :btree
    t.index ["user_id"], name: "tsdb_intelligencehistory_user_id", using: :btree
  end

  create_table "tsdb_intendedeffect", force: :cascade do |t|
    t.integer "i_type_id",   null: false
    t.text    "description"
    t.integer "campaign_id"
    t.integer "incident_id"
    t.index ["campaign_id"], name: "tsdb_intendedeffect_campaign_id", using: :btree
    t.index ["i_type_id", "campaign_id", "incident_id"], name: "tsdb_intendedeffect_i_type_id_32bc44a98df6ce01_uniq", unique: true, using: :btree
    t.index ["i_type_id"], name: "tsdb_intendedeffect_i_type_id", using: :btree
    t.index ["incident_id"], name: "tsdb_intendedeffect_incident_id", using: :btree
  end

  create_table "tsdb_intendedeffecttype", force: :cascade do |t|
    t.string "display_name", limit: 50, null: false
  end

  create_table "tsdb_keywordalertmatch", force: :cascade do |t|
    t.integer  "org_id",                  null: false
    t.string   "keyword",     limit: 140, null: false
    t.datetime "created_ts",              null: false
    t.datetime "modified_ts",             null: false
    t.string   "alerttype",   limit: 20,  null: false
    t.integer  "intel_id"
    t.integer  "report_id"
    t.integer  "tip_id"
    t.index ["intel_id"], name: "tsdb_keywordalertmatch_intel_id", using: :btree
    t.index ["org_id"], name: "tsdb_keywordalertmatch_org_id", using: :btree
    t.index ["report_id"], name: "tsdb_keywordalertmatch_report_id", using: :btree
    t.index ["tip_id"], name: "tsdb_keywordalertmatch_tip_id", using: :btree
  end

  create_table "tsdb_killchainstage", force: :cascade do |t|
    t.integer "value",                    null: false
    t.string  "display_name",  limit: 50, null: false
    t.string  "stix_phase_id", limit: 50, null: false
    t.index ["value"], name: "tsdb_killchainstage_value_key", unique: true, using: :btree
  end

  create_table "tsdb_launchlog", force: :cascade do |t|
    t.string "name",  limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.index "email varchar_pattern_ops", name: "tsdb_launchlog_email_like", using: :btree
    t.index ["email"], name: "tsdb_launchlog_email_key", unique: true, using: :btree
  end

  create_table "tsdb_lineitem", force: :cascade do |t|
    t.integer "item_type_id", null: false
    t.integer "item_id",      null: false
    t.integer "quantity",     null: false
    t.integer "order_id",     null: false
    t.index ["item_type_id"], name: "tsdb_lineitem_item_type_id", using: :btree
    t.index ["order_id"], name: "tsdb_lineitem_order_id", using: :btree
  end

  create_table "tsdb_malwaretype", force: :cascade do |t|
    t.integer "value",                   null: false
    t.string  "display_name", limit: 50, null: false
    t.index ["value"], name: "tsdb_malwaretype_value_key", unique: true, using: :btree
  end

  create_table "tsdb_myattacks", force: :cascade do |t|
    t.string   "detail1",              limit: 100,  null: false
    t.string   "detail2",              limit: 100,  null: false
    t.string   "attack_type",          limit: 100,  null: false
    t.datetime "created_ts",                        null: false
    t.datetime "modified_ts",                       null: false
    t.string   "attacker_address",     limit: 2048, null: false
    t.string   "attacker_hostname",    limit: 2048, null: false
    t.string   "attacker_countrycode", limit: 10,   null: false
    t.string   "device_source",        limit: 20,   null: false
    t.string   "transport_protocol",   limit: 16,   null: false
    t.string   "outcome",              limit: 10,   null: false
    t.string   "target_address",       limit: 50,   null: false
    t.string   "target_hostname",      limit: 253,  null: false
    t.string   "target_port",          limit: 100,  null: false
    t.string   "request_url",          limit: 2048, null: false
    t.string   "source_email",         limit: 2048, null: false
    t.integer  "count"
    t.integer  "org_id",                            null: false
    t.text     "tags",                                           array: true
    t.index ["attack_type"], name: "tsdb_myattacks_attack_type", using: :btree
    t.index ["attacker_address"], name: "tsdb_myattacks_attacker_address", using: :btree
    t.index ["attacker_countrycode"], name: "tsdb_myattacks_attacker_countrycode", using: :btree
    t.index ["attacker_hostname"], name: "tsdb_myattacks_attacker_hostname", using: :btree
    t.index ["created_ts"], name: "tsdb_myattacks_created_ts", using: :btree
    t.index ["device_source"], name: "tsdb_myattacks_device_source", using: :btree
    t.index ["modified_ts"], name: "tsdb_myattacks_modified_ts", using: :btree
    t.index ["org_id"], name: "tsdb_myattacks_org_id", using: :btree
    t.index ["transport_protocol"], name: "tsdb_myattacks_transport_protocol", using: :btree
  end

  create_table "tsdb_opticlink", force: :cascade do |t|
    t.string   "os",                limit: 20,  null: false
    t.string   "os_version",        limit: 20,  null: false
    t.string   "arch",              limit: 10,  null: false
    t.string   "opticlink_version", limit: 10,  null: false
    t.string   "path",              limit: 100, null: false
    t.datetime "timestamp",                     null: false
    t.string   "flavor",            limit: 10,  null: false
    t.string   "sha256",            limit: 64,  null: false
    t.boolean  "is_public",                     null: false
  end

  create_table "tsdb_opticlink_organizations", force: :cascade do |t|
    t.integer "opticlink_id",        null: false
    t.integer "userorganization_id", null: false
    t.index ["opticlink_id", "userorganization_id"], name: "tsdb_opticlink_organizations_opticlink_id_67c16f4538d880e_uniq", unique: true, using: :btree
    t.index ["opticlink_id"], name: "tsdb_opticlink_organizations_opticlink_id", using: :btree
    t.index ["userorganization_id"], name: "tsdb_opticlink_organizations_userorganization_id", using: :btree
  end

  create_table "tsdb_opticlinkprofile", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.datetime "last_content"
    t.datetime "last_intelligence"
    t.string   "flavor",            limit: 10,   null: false
    t.boolean  "auto_update",                    null: false
    t.boolean  "auto_content",                   null: false
    t.datetime "created_ts",                     null: false
    t.string   "source_address",    limit: 20,   null: false
    t.boolean  "service",                        null: false
    t.integer  "frequency_seconds",              null: false
    t.string   "version",           limit: 10,   null: false
    t.datetime "last_my_attacks"
    t.json     "integrations"
    t.datetime "last_whitelist"
    t.string   "os",                limit: 20
    t.string   "os_version",        limit: 20
    t.string   "arch",              limit: 10
    t.string   "filter",            limit: 4096
    t.string   "name",              limit: 50
    t.index ["user_id"], name: "tsdb_opticlinkprofile_user_id", using: :btree
  end

  create_table "tsdb_order", force: :cascade do |t|
    t.integer  "organization_id",            null: false
    t.integer  "user_id",                    null: false
    t.string   "status",          limit: 10, null: false
    t.datetime "created_ts",                 null: false
    t.datetime "modified_ts",                null: false
    t.index ["organization_id"], name: "tsdb_order_organization_id", using: :btree
    t.index ["user_id"], name: "tsdb_order_user_id", using: :btree
  end

  create_table "tsdb_orgalertkeyword", force: :cascade do |t|
    t.integer "org_id",              null: false
    t.string  "keyword", limit: 140, null: false
    t.index ["org_id", "keyword"], name: "tsdb_orgalertkeyword_org_id_207a444fa2be02c1_uniq", unique: true, using: :btree
    t.index ["org_id"], name: "tsdb_orgalertkeyword_org_id", using: :btree
  end

  create_table "tsdb_orgemail", force: :cascade do |t|
    t.string  "email",  limit: 254, null: false
    t.integer "org_id",             null: false
    t.index ["email"], name: "tsdb_orgemail_email_uniq", unique: true, using: :btree
    t.index ["org_id"], name: "tsdb_orgemail_org_id", using: :btree
  end

  create_table "tsdb_orgwhitelist", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.integer  "org_id"
    t.string   "value_type",  limit: 20,  null: false
    t.datetime "created_ts",              null: false
    t.datetime "modified_ts",             null: false
    t.index ["org_id"], name: "tsdb_orgwhitelist_org_id", using: :btree
    t.index ["value", "org_id", "value_type"], name: "tsdb_orgwhitelist_value_d5b4bc493d8d8a5_uniq", unique: true, using: :btree
  end

  create_table "tsdb_payment", force: :cascade do |t|
    t.text     "token",           null: false
    t.integer  "amount_cents",    null: false
    t.integer  "organization_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_ts",      null: false
    t.integer  "order_id",        null: false
    t.boolean  "remember_card",   null: false
    t.index ["order_id"], name: "tsdb_payment_order_id", using: :btree
    t.index ["organization_id"], name: "tsdb_payment_organization_id", using: :btree
    t.index ["user_id"], name: "tsdb_payment_user_id", using: :btree
  end

  create_table "tsdb_privatecase", force: :cascade do |t|
    t.integer "organization_id",      null: false
    t.integer "threat_model_type_id", null: false
    t.integer "threat_model_id",      null: false
    t.integer "case_status_id",       null: false
    t.index ["case_status_id"], name: "tsdb_privatecase_case_status_id", using: :btree
    t.index ["organization_id", "threat_model_type_id", "threat_model_id"], name: "tsdb_privatecase_organization_id_200916ed9066e966_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_privatecase_organization_id", using: :btree
    t.index ["threat_model_type_id"], name: "tsdb_privatecase_threat_model_type_id", using: :btree
  end

  create_table "tsdb_privatestatus", force: :cascade do |t|
    t.integer "organization_id",             null: false
    t.string  "status_name",     limit: 100, null: false
    t.integer "rank",                        null: false
    t.index ["organization_id", "rank"], name: "tsdb_privatestatus_organization_id_21fdb1c225c987cf_uniq", unique: true, using: :btree
    t.index ["organization_id", "status_name"], name: "tsdb_privatestatus_organization_id_5006c41538870cba_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_privatestatus_organization_id", using: :btree
  end

  create_table "tsdb_report", force: :cascade do |t|
    t.integer  "org_id",                              null: false
    t.integer  "report_configuration_id",             null: false
    t.datetime "created_ts",                          null: false
    t.json     "result"
    t.integer  "user_id"
    t.string   "result_s3_url",           limit: 255
    t.string   "result_mime_type",        limit: 32
    t.index ["org_id"], name: "tsdb_report_org_id", using: :btree
    t.index ["report_configuration_id"], name: "tsdb_report_report_configuration_id", using: :btree
    t.index ["user_id"], name: "tsdb_report_user_id", using: :btree
  end

  create_table "tsdb_reportconfiguration", force: :cascade do |t|
    t.string   "title",            limit: 255, null: false
    t.datetime "created_ts",                   null: false
    t.datetime "modified_ts",                  null: false
    t.boolean  "is_active",                    null: false
    t.string   "x_label",          limit: 64
    t.string   "y_label",          limit: 64
    t.integer  "interval_seconds",             null: false
    t.string   "report_type",      limit: 100
    t.string   "query_type",       limit: 100, null: false
    t.text     "query"
    t.boolean  "crosstabulate",                null: false
    t.text     "description"
    t.index "title varchar_pattern_ops", name: "tsdb_reportconfiguration_title_like", using: :btree
    t.index ["title"], name: "tsdb_reportconfiguration_title_key", unique: true, using: :btree
    t.index ["title"], name: "tsdb_reportconfiguration_title_uniq", unique: true, using: :btree
  end

  create_table "tsdb_reportedfile", force: :cascade do |t|
    t.string   "file",           limit: 100
    t.string   "url",            limit: 1024
    t.string   "md5",            limit: 255
    t.datetime "date_added",                  null: false
    t.string   "sha1",           limit: 255
    t.string   "sha256",         limit: 255
    t.integer  "user_id"
    t.boolean  "malicious",                   null: false
    t.string   "detail",         limit: 255
    t.string   "yara",           limit: 255
    t.string   "virustotal",     limit: 255
    t.text     "maec_report",                 null: false
    t.text     "html_report",                 null: false
    t.string   "status",         limit: 255
    t.string   "jobID",          limit: 255
    t.string   "notes",          limit: 100,  null: false
    t.string   "classification", limit: 100
    t.integer  "pdf_generated",               null: false
    t.string   "platform",       limit: 25
    t.string   "sandbox_vendor", limit: 25
    t.string   "verdict",        limit: 25
    t.integer  "confidence"
    t.index "md5 varchar_pattern_ops", name: "tsdb_reportedfile_md5_like", using: :btree
    t.index "sha1 varchar_pattern_ops", name: "tsdb_reportedfile_sha1_like", using: :btree
    t.index "sha256 varchar_pattern_ops", name: "tsdb_reportedfile_sha256_like", using: :btree
    t.index ["user_id"], name: "tsdb_reportedfile_user_id", using: :btree
  end

  create_table "tsdb_reportedfile_circles", force: :cascade do |t|
    t.integer "reportedfile_id",  null: false
    t.integer "trustedcircle_id", null: false
    t.index ["reportedfile_id", "trustedcircle_id"], name: "tsdb_reportedfile_circles_reportedfile_id_1c344c63d89ee1eb_uniq", unique: true, using: :btree
    t.index ["reportedfile_id"], name: "tsdb_reportedfile_circles_reportedfile_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_reportedfile_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_reportedfile_downvotes", force: :cascade do |t|
    t.integer "reportedfile_id", null: false
    t.integer "user_id",         null: false
    t.index ["reportedfile_id", "user_id"], name: "tsdb_reportedfile_downvote_reportedfile_id_d6ec12bfbb9fbb2_uniq", unique: true, using: :btree
    t.index ["reportedfile_id"], name: "tsdb_reportedfile_downvotes_reportedfile_id", using: :btree
    t.index ["user_id"], name: "tsdb_reportedfile_downvotes_user_id", using: :btree
  end

  create_table "tsdb_reportedfile_stars", force: :cascade do |t|
    t.integer "reportedfile_id", null: false
    t.integer "user_id",         null: false
    t.index ["reportedfile_id", "user_id"], name: "tsdb_reportedfile_stars_reportedfile_id_3337754b07621956_uniq", unique: true, using: :btree
    t.index ["reportedfile_id"], name: "tsdb_reportedfile_stars_reportedfile_id", using: :btree
    t.index ["user_id"], name: "tsdb_reportedfile_stars_user_id", using: :btree
  end

  create_table "tsdb_reportedfile_upvotes", force: :cascade do |t|
    t.integer "reportedfile_id", null: false
    t.integer "user_id",         null: false
    t.index ["reportedfile_id", "user_id"], name: "tsdb_reportedfile_upvotes_reportedfile_id_6be321547cd7_uniq", unique: true, using: :btree
    t.index ["reportedfile_id"], name: "tsdb_reportedfile_upvotes_reportedfile_id", using: :btree
    t.index ["user_id"], name: "tsdb_reportedfile_upvotes_user_id", using: :btree
  end

  create_table "tsdb_reportedfile_watching", force: :cascade do |t|
    t.integer "reportedfile_id", null: false
    t.integer "user_id",         null: false
    t.index ["reportedfile_id", "user_id"], name: "tsdb_reportedfile_watchin_reportedfile_id_303aa20392ba07af_uniq", unique: true, using: :btree
    t.index ["reportedfile_id"], name: "tsdb_reportedfile_watching_reportedfile_id", using: :btree
    t.index ["user_id"], name: "tsdb_reportedfile_watching_user_id", using: :btree
  end

  create_table "tsdb_reportedfilecomment", force: :cascade do |t|
    t.text     "comment",    null: false
    t.datetime "created_ts", null: false
    t.inet     "ip_address"
    t.integer  "user_id",    null: false
    t.index ["user_id"], name: "tsdb_reportedfilecomment_user_id", using: :btree
  end

  create_table "tsdb_reportedfilecomment_reported_files", force: :cascade do |t|
    t.integer "reportedfilecomment_id", null: false
    t.integer "reportedfile_id",        null: false
    t.index ["reportedfile_id"], name: "tsdb_reportedfilecomment_reported_files_reportedfile_id", using: :btree
    t.index ["reportedfilecomment_id", "reportedfile_id"], name: "tsdb_reportedfilec_reportedfilecomment_id_468224aef2d062c5_uniq", unique: true, using: :btree
    t.index ["reportedfilecomment_id"], name: "tsdb_reportedfilecomment_reported_files_reportedfilecomment_id", using: :btree
  end

  create_table "tsdb_reportsubscription", force: :cascade do |t|
    t.integer  "org_id",        null: false
    t.datetime "created_ts",    null: false
    t.datetime "modified_ts",   null: false
    t.boolean  "alive",         null: false
    t.integer  "plan_id",       null: false
    t.datetime "expiration_ts"
    t.index ["org_id", "plan_id"], name: "tsdb_reportsubscription_org_id_4c03850115ce3b7c_uniq", unique: true, using: :btree
    t.index ["org_id"], name: "tsdb_reportsubscription_org_id", using: :btree
    t.index ["plan_id"], name: "tsdb_reportsubscription_plan_id", using: :btree
  end

  create_table "tsdb_reportsubscriptionplan", force: :cascade do |t|
    t.text     "description"
    t.integer  "report_configuration_id",            null: false
    t.string   "period",                  limit: 10, null: false
    t.datetime "created_ts",                         null: false
    t.string   "validity",                limit: 20, null: false
    t.bigint   "bytes_per_day",                      null: false
    t.boolean  "is_trial",                           null: false
    t.integer  "expire_downgrade_id"
    t.index ["expire_downgrade_id"], name: "tsdb_reportsubscriptionplan_expire_downgrade_id", using: :btree
    t.index ["report_configuration_id", "period", "validity", "bytes_per_day"], name: "tsdb_reportsubscr_report_configuration_id_59e5e3c83f0ef98f_uniq", unique: true, using: :btree
    t.index ["report_configuration_id"], name: "tsdb_reportsubscriptionplan_report_configuration_id", using: :btree
  end

  create_table "tsdb_reseller", force: :cascade do |t|
    t.datetime "created_ts",                          null: false
    t.datetime "modified_ts",                         null: false
    t.string   "registration_source",    limit: 32,   null: false
    t.string   "name",                   limit: 128,  null: false
    t.string   "admin_contact",          limit: 1024, null: false
    t.string   "support_contact",        limit: 1024, null: false
    t.string   "description",            limit: 1024, null: false
    t.string   "domain",                 limit: 128
    t.string   "logo_relative_path",     limit: 256
    t.integer  "permissions_group_id"
    t.text     "license_text",                        null: false
    t.string   "license_title",          limit: 1024, null: false
    t.boolean  "rebranded_site",                      null: false
    t.boolean  "use_short_license",                   null: false
    t.string   "short_license_text",     limit: 2048
    t.integer  "default_user_limit"
    t.boolean  "hard_user_count_limit",               null: false
    t.string   "user_limit_met_message", limit: 512
    t.boolean  "is_tfa_enabled",                      null: false
    t.boolean  "require_authorization",               null: false
    t.boolean  "allow_free_emails",                   null: false
    t.index ["permissions_group_id"], name: "tsdb_reseller_permissions_group_id", using: :btree
    t.index ["registration_source"], name: "tsdb_reseller_registration_source_uniq", unique: true, using: :btree
  end

  create_table "tsdb_reseller_circles", force: :cascade do |t|
    t.integer "reseller_id",      null: false
    t.integer "trustedcircle_id", null: false
    t.index ["reseller_id", "trustedcircle_id"], name: "tsdb_reseller_circles_reseller_id_3e82c8401af7e923_uniq", unique: true, using: :btree
    t.index ["reseller_id"], name: "tsdb_reseller_circles_reseller_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_reseller_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_searchfilter", force: :cascade do |t|
    t.integer  "created_by_user_id",              null: false
    t.integer  "org_id",                          null: false
    t.string   "name",               limit: 255,  null: false
    t.string   "query",              limit: 1024, null: false
    t.datetime "created_ts",                      null: false
    t.datetime "modified_ts",                     null: false
    t.boolean  "alive"
    t.index ["created_by_user_id"], name: "tsdb_searchfilter_created_by_user_id", using: :btree
    t.index ["org_id"], name: "tsdb_searchfilter_org_id", using: :btree
  end

  create_table "tsdb_settings", force: :cascade do |t|
    t.string "key",   limit: 200, null: false
    t.text   "value",             null: false
    t.index "key varchar_pattern_ops", name: "tsdb_settings_key_like", using: :btree
    t.index ["key"], name: "tsdb_settings_key_key", unique: true, using: :btree
  end

  create_table "tsdb_signature", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.integer  "s_type_id",                      null: false
    t.integer  "organization_id",                null: false
    t.boolean  "is_public",                      null: false
    t.text     "notes"
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.string   "tlp",                limit: 255
    t.text     "tags",                                        array: true
    t.string   "publication_status", limit: 30,  null: false
    t.index ["name", "organization_id"], name: "tsdb_signature_name_6127a5fe9d2cc657_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_signature_organization_id", using: :btree
    t.index ["s_type_id"], name: "tsdb_signature_s_type_id", using: :btree
  end

  create_table "tsdb_signature_circles", force: :cascade do |t|
    t.integer "signature_id",     null: false
    t.integer "trustedcircle_id", null: false
    t.index ["signature_id", "trustedcircle_id"], name: "tsdb_signature_circles_signature_id_271e5e5f184aa91_uniq", unique: true, using: :btree
    t.index ["signature_id"], name: "tsdb_signature_circles_signature_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_signature_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_signature_downvotes", force: :cascade do |t|
    t.integer "signature_id", null: false
    t.integer "user_id",      null: false
    t.index ["signature_id", "user_id"], name: "tsdb_signature_downvotes_signature_id_11029ccc67243460_uniq", unique: true, using: :btree
    t.index ["signature_id"], name: "tsdb_signature_downvotes_signature_id", using: :btree
    t.index ["user_id"], name: "tsdb_signature_downvotes_user_id", using: :btree
  end

  create_table "tsdb_signature_stars", force: :cascade do |t|
    t.integer "signature_id", null: false
    t.integer "user_id",      null: false
    t.index ["signature_id", "user_id"], name: "tsdb_signature_stars_signature_id_5c5c6bd0869711ec_uniq", unique: true, using: :btree
    t.index ["signature_id"], name: "tsdb_signature_stars_signature_id", using: :btree
    t.index ["user_id"], name: "tsdb_signature_stars_user_id", using: :btree
  end

  create_table "tsdb_signature_upvotes", force: :cascade do |t|
    t.integer "signature_id", null: false
    t.integer "user_id",      null: false
    t.index ["signature_id", "user_id"], name: "tsdb_signature_upvotes_signature_id_1221c021fcf3e075_uniq", unique: true, using: :btree
    t.index ["signature_id"], name: "tsdb_signature_upvotes_signature_id", using: :btree
    t.index ["user_id"], name: "tsdb_signature_upvotes_user_id", using: :btree
  end

  create_table "tsdb_signature_watching", force: :cascade do |t|
    t.integer "signature_id", null: false
    t.integer "user_id",      null: false
    t.index ["signature_id", "user_id"], name: "tsdb_signature_watching_signature_id_7adb711e4f720c8d_uniq", unique: true, using: :btree
    t.index ["signature_id"], name: "tsdb_signature_watching_signature_id", using: :btree
    t.index ["user_id"], name: "tsdb_signature_watching_user_id", using: :btree
  end

  create_table "tsdb_signaturetype", force: :cascade do |t|
    t.integer "value",                   null: false
    t.string  "display_name", limit: 50, null: false
    t.index ["value"], name: "tsdb_signaturetype_value_key", unique: true, using: :btree
  end

  create_table "tsdb_sku", force: :cascade do |t|
    t.integer "price_cents",         null: false
    t.integer "old_product_type_id"
    t.integer "old_product_id"
    t.integer "product_type_id",     null: false
    t.integer "product_id",          null: false
    t.index ["old_product_type_id"], name: "tsdb_sku_old_product_type_id", using: :btree
    t.index ["product_type_id"], name: "tsdb_sku_product_type_id", using: :btree
  end

  create_table "tsdb_snapshot", force: :cascade do |t|
    t.integer  "intel_version",                     null: false
    t.string   "snapshot_type",         limit: 25,  null: false
    t.string   "snapshot_format",       limit: 25,  null: false
    t.string   "index_type",            limit: 25,  null: false
    t.integer  "index_id",                          null: false
    t.string   "sha256sum",             limit: 64
    t.datetime "snapshot_ts",                       null: false
    t.string   "file_path",             limit: 256
    t.integer  "owner_organization_id"
    t.json     "files"
    t.string   "status",                limit: 25,  null: false
    t.json     "custom_config"
    t.index ["owner_organization_id"], name: "tsdb_snapshot_owner_organization_id", using: :btree
  end

  create_table "tsdb_stixcomment", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "ttp_id"
    t.integer  "user_id",                  null: false
    t.string   "title",        limit: 255
    t.text     "body"
    t.datetime "created_ts",               null: false
    t.datetime "modified_ts",              null: false
    t.boolean  "alive"
    t.integer  "campaign_id"
    t.integer  "incident_id"
    t.integer  "signature_id"
    t.index ["actor_id"], name: "tsdb_stixcomment_actor_id", using: :btree
    t.index ["campaign_id"], name: "tsdb_stixcomment_campaign_id", using: :btree
    t.index ["incident_id"], name: "tsdb_stixcomment_incident_id", using: :btree
    t.index ["signature_id"], name: "tsdb_stixcomment_signature_id", using: :btree
    t.index ["ttp_id"], name: "tsdb_stixcomment_ttp_id", using: :btree
    t.index ["user_id"], name: "tsdb_stixcomment_user_id", using: :btree
  end

  create_table "tsdb_stixexternalreference", force: :cascade do |t|
    t.string  "title",       limit: 255, null: false
    t.string  "r_type",      limit: 1,   null: false
    t.string  "url",         limit: 255
    t.string  "filename",    limit: 100
    t.string  "s3_url",      limit: 255
    t.integer "actor_id"
    t.integer "campaign_id"
    t.integer "incident_id"
    t.index ["actor_id"], name: "tsdb_actorexternalreference_actor_id", using: :btree
    t.index ["campaign_id"], name: "tsdb_stixexternalreference_campaign_id", using: :btree
    t.index ["incident_id"], name: "tsdb_stixexternalreference_incident_id", using: :btree
  end

  create_table "tsdb_taxiisite", force: :cascade do |t|
    t.integer  "created_by_user_id",              null: false
    t.integer  "organization_id",                 null: false
    t.string   "name",               limit: 255,  null: false
    t.string   "url",                limit: 1024
    t.string   "user",               limit: 255,  null: false
    t.text     "password"
    t.text     "cert_data"
    t.string   "cert_type",          limit: 100
    t.text     "cert_password"
    t.string   "last_status",        limit: 255,  null: false
    t.string   "last_status_msg",    limit: 4096, null: false
    t.datetime "created_ts",                      null: false
    t.datetime "modified_ts",                     null: false
    t.index ["created_by_user_id"], name: "tsdb_taxiisite_created_by_user_id", using: :btree
    t.index ["organization_id", "name"], name: "tsdb_taxiisite_organization_id_4b072700dbadf3df_uniq", unique: true, using: :btree
    t.index ["organization_id", "url"], name: "tsdb_taxiisite_organization_id_6317dedb52117cbc_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_taxiisite_organization_id", using: :btree
  end

  create_table "tsdb_taxiitaskactivity", force: :cascade do |t|
    t.integer  "task_id",                 null: false
    t.string   "message",    limit: 4096, null: false
    t.datetime "created_ts",              null: false
    t.index ["task_id"], name: "tsdb_taxiitaskactivity_task_id", using: :btree
  end

  create_table "tsdb_taxiitaskconfiguration", force: :cascade do |t|
    t.integer  "created_by_user_id",                 null: false
    t.integer  "organization_id",                    null: false
    t.string   "config_type",           limit: 100,  null: false
    t.integer  "search_filter_id"
    t.integer  "inbox_id"
    t.integer  "taxii_site_id",                      null: false
    t.string   "collection",            limit: 255,  null: false
    t.integer  "schedule_id"
    t.string   "status",                limit: 1024, null: false
    t.datetime "last_processed"
    t.integer  "last_processed_id",                  null: false
    t.integer  "observables_processed",              null: false
    t.datetime "created_ts",                         null: false
    t.datetime "modified_ts",                        null: false
    t.index ["created_by_user_id"], name: "tsdb_taxiitaskconfiguration_created_by_user_id", using: :btree
    t.index ["inbox_id"], name: "tsdb_taxiitaskconfiguration_inbox_id", using: :btree
    t.index ["organization_id"], name: "tsdb_taxiitaskconfiguration_organization_id", using: :btree
    t.index ["schedule_id"], name: "tsdb_taxiitaskconfiguration_schedule_id", using: :btree
    t.index ["search_filter_id"], name: "tsdb_taxiitaskconfiguration_search_filter_id", using: :btree
    t.index ["taxii_site_id"], name: "tsdb_taxiitaskconfiguration_taxii_site_id", using: :btree
  end

  create_table "tsdb_texttemplate", force: :cascade do |t|
    t.string   "name",            limit: 100, null: false
    t.text     "body",                        null: false
    t.integer  "organization_id",             null: false
    t.datetime "created_ts",                  null: false
    t.datetime "modified_ts",                 null: false
    t.index ["name", "organization_id"], name: "tsdb_texttemplate_name_127a859037e72b9f_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_texttemplate_organization_id", using: :btree
  end

  create_table "tsdb_threatmodelhistory", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "campaign_id"
    t.integer  "incident_id"
    t.integer  "ttp_id"
    t.string   "action",       limit: 255
    t.datetime "ts",                       null: false
    t.integer  "signature_id"
    t.index ["actor_id"], name: "tsdb_threatmodelhistory_actor_id", using: :btree
    t.index ["campaign_id"], name: "tsdb_threatmodelhistory_campaign_id", using: :btree
    t.index ["incident_id"], name: "tsdb_threatmodelhistory_incident_id", using: :btree
    t.index ["signature_id"], name: "tsdb_threatmodelhistory_signature_id", using: :btree
    t.index ["ttp_id"], name: "tsdb_threatmodelhistory_ttp_id", using: :btree
  end

  create_table "tsdb_tipattachment", force: :cascade do |t|
    t.integer  "tip_report_id",                 null: false
    t.integer  "user_id",                       null: false
    t.string   "filename",         limit: 255,  null: false
    t.string   "content_type",     limit: 255,  null: false
    t.string   "s3_url",           limit: 1024, null: false
    t.datetime "created_ts",                    null: false
    t.datetime "modified_ts",                   null: false
    t.boolean  "alive"
    t.string   "s3_thumbnail_url", limit: 1024
    t.index ["tip_report_id"], name: "tsdb_tipattachment_tip_report_id", using: :btree
    t.index ["user_id"], name: "tsdb_tipattachment_user_id", using: :btree
  end

  create_table "tsdb_tipcomment", force: :cascade do |t|
    t.integer  "tip_report_id",             null: false
    t.integer  "user_id",                   null: false
    t.string   "title",         limit: 255
    t.text     "body"
    t.datetime "created_ts",                null: false
    t.datetime "modified_ts",               null: false
    t.boolean  "alive"
    t.index ["tip_report_id"], name: "tsdb_tipcomment_tip_report_id", using: :btree
    t.index ["user_id"], name: "tsdb_tipcomment_user_id", using: :btree
  end

  create_table "tsdb_tiphistory", force: :cascade do |t|
    t.integer  "tip_report_id",             null: false
    t.integer  "user_id",                   null: false
    t.string   "action",        limit: 255
    t.text     "detail"
    t.datetime "ts",                        null: false
    t.integer  "quantity"
    t.index ["tip_report_id"], name: "tsdb_tiphistory_tip_report_id", using: :btree
    t.index ["user_id"], name: "tsdb_tiphistory_user_id", using: :btree
  end

  create_table "tsdb_tipreport", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.boolean  "is_public",                      null: false
    t.integer  "owner_user_id"
    t.integer  "owner_org_id"
    t.integer  "assignee_user_id"
    t.integer  "assignee_org_id"
    t.string   "status",             limit: 30,  null: false
    t.text     "tags",                                        array: true
    t.string   "threat_actor",       limit: 255
    t.string   "campaign",           limit: 255
    t.string   "ttp",                limit: 255
    t.string   "tlp",                limit: 255
    t.string   "source",             limit: 255
    t.text     "body"
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.boolean  "alive"
    t.tsvector "fulltext",                       null: false
    t.string   "original_source",    limit: 50
    t.string   "original_source_id", limit: 255
    t.integer  "parent_id"
    t.boolean  "is_cloneable",                   null: false
    t.string   "body_content_type",  limit: 10
    t.index ["assignee_org_id"], name: "tsdb_tipreport_assignee_org_id", using: :btree
    t.index ["assignee_user_id"], name: "tsdb_tipreport_assignee_user_id", using: :btree
    t.index ["fulltext"], name: "tsdb_tipreport_fulltext_gin", using: :gin
    t.index ["original_source", "original_source_id"], name: "tsdb_tipreport_original_source_4d8e27f61dc8e46a_uniq", unique: true, using: :btree
    t.index ["owner_org_id"], name: "tsdb_tipreport_owner_org_id", using: :btree
    t.index ["owner_user_id"], name: "tsdb_tipreport_owner_user_id", using: :btree
    t.index ["parent_id"], name: "tsdb_tipreport_parent_id", using: :btree
  end

  create_table "tsdb_tipreport_actors", force: :cascade do |t|
    t.integer "tipreport_id", null: false
    t.integer "actor_id",     null: false
    t.index ["actor_id"], name: "tsdb_tipreport_actors_actor_id", using: :btree
    t.index ["tipreport_id", "actor_id"], name: "tsdb_tipreport_actors_tipreport_id_2201f3006b639e11_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_actors_tipreport_id", using: :btree
  end

  create_table "tsdb_tipreport_circles", force: :cascade do |t|
    t.integer "tipreport_id",     null: false
    t.integer "trustedcircle_id", null: false
    t.index ["tipreport_id", "trustedcircle_id"], name: "tsdb_tipreport_circles_tipreport_id_ad0ac0091a3d9d_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_circles_tipreport_id", using: :btree
    t.index ["trustedcircle_id"], name: "tsdb_tipreport_circles_trustedcircle_id", using: :btree
  end

  create_table "tsdb_tipreport_downvotes", force: :cascade do |t|
    t.integer "tipreport_id", null: false
    t.integer "user_id",      null: false
    t.index ["tipreport_id", "user_id"], name: "tsdb_tipreport_downvotes_tipreport_id_7d12ec02f1be3c88_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_downvotes_tipreport_id", using: :btree
    t.index ["user_id"], name: "tsdb_tipreport_downvotes_user_id", using: :btree
  end

  create_table "tsdb_tipreport_import_sessions", force: :cascade do |t|
    t.integer "tipreport_id",  null: false
    t.integer "importdata_id", null: false
    t.index ["importdata_id"], name: "tsdb_tipreport_import_sessions_importdata_id", using: :btree
    t.index ["tipreport_id", "importdata_id"], name: "tsdb_tipreport_import_sessio_tipreport_id_4507c6be176bb79c_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_import_sessions_tipreport_id", using: :btree
  end

  create_table "tsdb_tipreport_intelligence", force: :cascade do |t|
    t.integer "tipreport_id",     null: false
    t.bigint  "intelligence2_id", null: false
    t.index ["intelligence2_id"], name: "tsdb_tipreport_intelligence_intelligence2_id", using: :btree
    t.index ["tipreport_id", "intelligence2_id"], name: "tsdb_tipreport_intelligence_tipreport_id_c47d7d3d9053a44_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_intelligence_tipreport_id", using: :btree
  end

  create_table "tsdb_tipreport_sandbox_reports", force: :cascade do |t|
    t.integer "tipreport_id",    null: false
    t.integer "reportedfile_id", null: false
    t.index ["reportedfile_id"], name: "tsdb_tipreport_sandbox_reports_reportedfile_id", using: :btree
    t.index ["tipreport_id", "reportedfile_id"], name: "tsdb_tipreport_sandbox_repor_tipreport_id_77039957d6f2f68a_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_sandbox_reports_tipreport_id", using: :btree
  end

  create_table "tsdb_tipreport_stars", force: :cascade do |t|
    t.integer "tipreport_id", null: false
    t.integer "user_id",      null: false
    t.index ["tipreport_id", "user_id"], name: "tsdb_tipreport_stars_tipreport_id_39e05499e53b2e9c_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_stars_tipreport_id", using: :btree
    t.index ["user_id"], name: "tsdb_tipreport_stars_user_id", using: :btree
  end

  create_table "tsdb_tipreport_upvotes", force: :cascade do |t|
    t.integer "tipreport_id", null: false
    t.integer "user_id",      null: false
    t.index ["tipreport_id", "user_id"], name: "tsdb_tipreport_upvotes_tipreport_id_40ba7c29553b9653_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_upvotes_tipreport_id", using: :btree
    t.index ["user_id"], name: "tsdb_tipreport_upvotes_user_id", using: :btree
  end

  create_table "tsdb_tipreport_watching", force: :cascade do |t|
    t.integer "tipreport_id", null: false
    t.integer "user_id",      null: false
    t.index ["tipreport_id", "user_id"], name: "tsdb_tipreport_watching_tipreport_id_c798f023521d2ad_uniq", unique: true, using: :btree
    t.index ["tipreport_id"], name: "tsdb_tipreport_watching_tipreport_id", using: :btree
    t.index ["user_id"], name: "tsdb_tipreport_watching_user_id", using: :btree
  end

  create_table "tsdb_tsapiuseraction", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.datetime "created_ts",              null: false
    t.datetime "modified_ts",             null: false
    t.string   "endpoint",    limit: 100, null: false
    t.string   "method",      limit: 30,  null: false
    t.integer  "status_code",             null: false
    t.string   "user_agent",  limit: 400
    t.index ["user_id"], name: "tsdb_tsapiuseraction_user_id", using: :btree
  end

  create_table "tsdb_tsbadgeassignment", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "badge_id",    null: false
    t.datetime "created_ts",  null: false
    t.datetime "modified_ts", null: false
    t.index ["badge_id"], name: "tsdb_tsbadgeassignment_badge_id", using: :btree
    t.index ["user_id"], name: "tsdb_tsbadgeassignment_user_id", using: :btree
  end

  create_table "tsdb_tsbadgedefinition", force: :cascade do |t|
    t.string  "category",           limit: 20,  null: false
    t.string  "_type",              limit: 30,  null: false
    t.string  "name",               limit: 30,  null: false
    t.string  "description",        limit: 140, null: false
    t.string  "logo_relative_path", limit: 255, null: false
    t.string  "criteria",           limit: 400, null: false
    t.boolean "unique",                         null: false
  end

  create_table "tsdb_tsinvestigation", force: :cascade do |t|
    t.string   "name",             limit: 512, null: false
    t.boolean  "is_public",                    null: false
    t.integer  "owner_org_id",                 null: false
    t.integer  "reporter_id"
    t.integer  "assignee_type_id"
    t.integer  "assignee_id"
    t.integer  "tlp",                          null: false
    t.text     "description"
    t.integer  "priority",                     null: false
    t.datetime "created_ts",                   null: false
    t.datetime "modified_ts",                  null: false
    t.string   "status",           limit: 50
    t.text     "tags",                                      array: true
    t.index ["assignee_type_id"], name: "tsdb_tsinvestigation_assignee_type_id", using: :btree
    t.index ["name", "owner_org_id"], name: "tsdb_tsinvestigation_name_6b255de680233950_uniq", unique: true, using: :btree
    t.index ["owner_org_id"], name: "tsdb_tsinvestigation_owner_org_id", using: :btree
    t.index ["reporter_id"], name: "tsdb_tsinvestigation_reporter_id", using: :btree
  end

  create_table "tsdb_tsinvestigation_circles", force: :cascade do |t|
    t.integer "tsinvestigation_id", null: false
    t.integer "trustedcircle_id",   null: false
    t.index ["trustedcircle_id"], name: "tsdb_tsinvestigation_circles_trustedcircle_id", using: :btree
    t.index ["tsinvestigation_id", "trustedcircle_id"], name: "tsdb_tsinvestigation_c_tsinvestigation_id_36c8b9ba690ea027_uniq", unique: true, using: :btree
    t.index ["tsinvestigation_id"], name: "tsdb_tsinvestigation_circles_tsinvestigation_id", using: :btree
  end

  create_table "tsdb_tsinvestigation_tips", force: :cascade do |t|
    t.integer "tsinvestigation_id", null: false
    t.integer "tipreport_id",       null: false
    t.index ["tipreport_id"], name: "tsdb_tsinvestigation_tips_tipreport_id", using: :btree
    t.index ["tsinvestigation_id", "tipreport_id"], name: "tsdb_tsinvestigation_t_tsinvestigation_id_69bdd50e82b03e19_uniq", unique: true, using: :btree
    t.index ["tsinvestigation_id"], name: "tsdb_tsinvestigation_tips_tsinvestigation_id", using: :btree
  end

  create_table "tsdb_tsinvestigationanalysis", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.string   "file_content_type", limit: 1024
    t.string   "s3_url",            limit: 1024
    t.integer  "investigation_id",               null: false
    t.integer  "tlp",                            null: false
    t.text     "text_item"
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.index ["investigation_id"], name: "tsdb_tsinvestigationanalysis_investigation_id", using: :btree
    t.index ["user_id"], name: "tsdb_tsinvestigationanalysis_user_id", using: :btree
  end

  create_table "tsdb_tsinvestigationanalysis_elements", force: :cascade do |t|
    t.integer "tsinvestigationanalysis_id", null: false
    t.integer "tsinvestigationelement_id",  null: false
    t.index ["tsinvestigationanalysis_id", "tsinvestigationelement_id"], name: "tsdb_tsinvesti_tsinvestigationanalysis_id_217c1c97d55472eb_uniq", unique: true, using: :btree
    t.index ["tsinvestigationanalysis_id"], name: "tsdb_tsinvestigationanalysis_elements_tsinvestigationanalys8b6a", using: :btree
    t.index ["tsinvestigationelement_id"], name: "tsdb_tsinvestigationanalysis_elements_tsinvestigationelement_id", using: :btree
  end

  create_table "tsdb_tsinvestigationanalysis_parents", force: :cascade do |t|
    t.integer "from_tsinvestigationanalysis_id", null: false
    t.integer "to_tsinvestigationanalysis_id",   null: false
    t.index ["from_tsinvestigationanalysis_id", "to_tsinvestigationanalysis_id"], name: "tsdb_tsin_from_tsinvestigationanalysis_id_1e54e2edd42a6e08_uniq", unique: true, using: :btree
    t.index ["from_tsinvestigationanalysis_id"], name: "tsdb_tsinvestigationanalysis_parents_from_tsinvestigationan1965", using: :btree
    t.index ["to_tsinvestigationanalysis_id"], name: "tsdb_tsinvestigationanalysis_parents_to_tsinvestigationanala3eb", using: :btree
  end

  create_table "tsdb_tsinvestigationelement", force: :cascade do |t|
    t.integer  "r_type_id",                   null: false
    t.integer  "r_id"
    t.string   "relation_type",    limit: 50, null: false
    t.integer  "tlp",                         null: false
    t.integer  "score"
    t.integer  "investigation_id",            null: false
    t.datetime "created_ts",                  null: false
    t.datetime "modified_ts",                 null: false
    t.index ["investigation_id"], name: "tsdb_tsinvestigationelement_investigation_id", using: :btree
    t.index ["r_id", "r_type_id", "relation_type", "investigation_id"], name: "tsdb_tsinvestigationelement_r_id_6ac7d159284f0d3a_uniq", unique: true, using: :btree
    t.index ["r_type_id"], name: "tsdb_tsinvestigationelement_r_type_id", using: :btree
  end

  create_table "tsdb_tsinvestigationelement_parents", force: :cascade do |t|
    t.integer "from_tsinvestigationelement_id", null: false
    t.integer "to_tsinvestigationelement_id",   null: false
    t.index ["from_tsinvestigationelement_id", "to_tsinvestigationelement_id"], name: "tsdb_tsinv_from_tsinvestigationelement_id_5d02f0fdab958cbb_uniq", unique: true, using: :btree
    t.index ["from_tsinvestigationelement_id"], name: "tsdb_tsinvestigationelement_parents_from_tsinvestigationele3bbe", using: :btree
    t.index ["to_tsinvestigationelement_id"], name: "tsdb_tsinvestigationelement_parents_to_tsinvestigationeleme973f", using: :btree
  end

  create_table "tsdb_tsinvestigationhistory", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "action",           limit: 50, null: false
    t.text     "detail"
    t.integer  "quantity"
    t.integer  "investigation_id",            null: false
    t.datetime "created_ts",                  null: false
    t.datetime "modified_ts",                 null: false
    t.index ["investigation_id"], name: "tsdb_tsinvestigationhistory_investigation_id", using: :btree
    t.index ["user_id"], name: "tsdb_tsinvestigationhistory_user_id", using: :btree
  end

  create_table "tsdb_tsinvestigationtag", force: :cascade do |t|
    t.string   "name",             limit: 50, null: false
    t.string   "text_value",       limit: 50, null: false
    t.integer  "tlp",                         null: false
    t.datetime "created_ts",                  null: false
    t.datetime "modified_ts",                 null: false
    t.integer  "user_id",                     null: false
    t.integer  "investigation_id",            null: false
    t.index ["investigation_id"], name: "tsdb_tsinvestigationtag_investigation_id", using: :btree
    t.index ["user_id"], name: "tsdb_tsinvestigationtag_user_id", using: :btree
  end

  create_table "tsdb_tsinvestigationtag_elements", force: :cascade do |t|
    t.integer "tsinvestigationtag_id",     null: false
    t.integer "tsinvestigationelement_id", null: false
    t.index ["tsinvestigationelement_id"], name: "tsdb_tsinvestigationtag_elements_tsinvestigationelement_id", using: :btree
    t.index ["tsinvestigationtag_id", "tsinvestigationelement_id"], name: "tsdb_tsinvestigatio_tsinvestigationtag_id_41e7a68adbb7bf85_uniq", unique: true, using: :btree
    t.index ["tsinvestigationtag_id"], name: "tsdb_tsinvestigationtag_elements_tsinvestigationtag_id", using: :btree
  end

  create_table "tsdb_tsinvestigationtask", force: :cascade do |t|
    t.string   "status",           limit: 55, null: false
    t.string   "action",           limit: 55, null: false
    t.integer  "priority",                    null: false
    t.datetime "due_ts"
    t.integer  "investigation_id",            null: false
    t.integer  "assignee_type_id",            null: false
    t.integer  "assignee_id",                 null: false
    t.datetime "created_ts",                  null: false
    t.datetime "modified_ts",                 null: false
    t.integer  "created_by_id",               null: false
    t.string   "note"
    t.index ["assignee_type_id"], name: "tsdb_tsinvestigationtask_assignee_type_id", using: :btree
    t.index ["created_by_id"], name: "tsdb_tsinvestigationtask_created_by_id", using: :btree
    t.index ["investigation_id"], name: "tsdb_tsinvestigationtask_investigation_id", using: :btree
  end

  create_table "tsdb_tsinvestigationtasknote", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.text     "note",        null: false
    t.integer  "task_id",     null: false
    t.datetime "created_ts",  null: false
    t.datetime "modified_ts", null: false
    t.index ["task_id"], name: "tsdb_tsinvestigationtasknote_task_id", using: :btree
    t.index ["user_id"], name: "tsdb_tsinvestigationtasknote_user_id", using: :btree
  end

  create_table "tsdb_tsitemshare", force: :cascade do |t|
    t.integer "r_type_id"
    t.integer "r_id"
    t.integer "shared_with",     null: false
    t.integer "user_sharing_id", null: false
    t.index ["r_type_id"], name: "tsdb_tsitemshare_r_type_id", using: :btree
    t.index ["user_sharing_id"], name: "tsdb_tsitemshare_user_sharing_id", using: :btree
  end

  create_table "tsdb_tsnotification", force: :cascade do |t|
    t.string   "link_to",        limit: 1024, null: false
    t.string   "summary",        limit: 1024, null: false
    t.text     "description"
    t.integer  "status",                      null: false
    t.string   "_type",          limit: 20,   null: false
    t.integer  "severity"
    t.integer  "priority",                    null: false
    t.datetime "created_ts",                  null: false
    t.datetime "expiration_ts"
    t.integer  "r_type_id"
    t.integer  "r_id"
    t.integer  "owner_type_id",               null: false
    t.integer  "owner_id",                    null: false
    t.integer  "action_user_id",              null: false
    t.integer  "quantity"
    t.index ["action_user_id"], name: "tsdb_tsnotification_action_user_id", using: :btree
    t.index ["owner_id"], name: "tsdb_tsnotification_owner_id", using: :btree
    t.index ["owner_type_id"], name: "tsdb_tsnotification_owner_type_id", using: :btree
    t.index ["r_type_id"], name: "tsdb_tsnotification_r_type_id", using: :btree
  end

  create_table "tsdb_tsnotification_intelligence", force: :cascade do |t|
    t.integer "tsnotification_id", null: false
    t.integer "intelligence2_id",  null: false
    t.index ["intelligence2_id"], name: "tsdb_tsnotification_intelligence_intelligence2_id", using: :btree
    t.index ["tsnotification_id", "intelligence2_id"], name: "tsdb_tsnotification_int_tsnotification_id_724279a739b8886a_uniq", unique: true, using: :btree
    t.index ["tsnotification_id"], name: "tsdb_tsnotification_intelligence_tsnotification_id", using: :btree
  end

  create_table "tsdb_tsportal_profile", force: :cascade do |t|
    t.integer  "user_id",                                              null: false
    t.inet     "last_ip"
    t.boolean  "setup",                                                null: false
    t.datetime "date_last",                                            null: false
    t.string   "organization",                             limit: 100, null: false
    t.string   "phone_number",                             limit: 100, null: false
    t.string   "name",                                     limit: 100, null: false
    t.boolean  "looking_products",                                     null: false
    t.boolean  "have_budget",                                          null: false
    t.integer  "user_organization_id"
    t.string   "registration_source",                      limit: 50
    t.boolean  "can_approve_intel",                                    null: false
    t.boolean  "can_receive_tip_created_emails",                       null: false
    t.datetime "accepted_eula"
    t.boolean  "can_receive_match_alert_emails",                       null: false
    t.string   "tfa_shared_secret",                        limit: 16
    t.boolean  "can_receive_trusted_circle_emails",                    null: false
    t.boolean  "can_receive_tip_updated_emails",                       null: false
    t.boolean  "can_receive_tip_reassigned_emails",                    null: false
    t.boolean  "can_receive_tip_digest_emails",                        null: false
    t.boolean  "is_tfa_exempt",                                        null: false
    t.datetime "ack_opticlink_popup_ts"
    t.boolean  "can_receive_match_alert_digest_emails",                null: false
    t.boolean  "can_receive_import_session_emails",                    null: false
    t.boolean  "can_receive_import_session_digest_emails",             null: false
    t.text     "acknowledged_announcements",                                        array: true
    t.string   "avatar_s3_url",                            limit: 255
    t.string   "second_email_address",                     limit: 75
    t.string   "blog_url",                                 limit: 200
    t.string   "twitter_handle",                           limit: 100
    t.string   "linkedin_url",                             limit: 200
    t.string   "github_username",                          limit: 100
    t.string   "nickname",                                 limit: 100
    t.text     "summary"
    t.boolean  "searchable",                                           null: false
    t.boolean  "is_second_email_address_shared",                       null: false
    t.boolean  "is_blog_url_shared",                                   null: false
    t.boolean  "is_twitter_handle_shared",                             null: false
    t.boolean  "is_linkedin_url_shared",                               null: false
    t.boolean  "is_github_username_shared",                            null: false
    t.boolean  "is_name_shared",                                       null: false
    t.boolean  "is_summary_shared",                                    null: false
    t.boolean  "profile_ready",                                        null: false
    t.tsvector "search_index",                                         null: false
    t.string   "appcues_id",                               limit: 50
    t.json     "ui_preferences",                                       null: false
    t.boolean  "can_receive_report_created_emails",                    null: false
    t.boolean  "must_change_password"
    t.datetime "date_password_changed"
    t.text     "password_history",                                                  array: true
    t.datetime "ack_profile_creation_popup_ts"
    t.boolean  "can_share_intelligence",                               null: false
    t.string   "can_receive_investigation_alerts",         limit: 50
    t.boolean  "can_import_to_taxii_inbox",                            null: false
    t.index "nickname varchar_pattern_ops", name: "tsdb_tsportal_profile_nickname_like", using: :btree
    t.index ["nickname"], name: "tsdb_tsportal_profile_nickname_key", unique: true, using: :btree
    t.index ["search_index"], name: "tsdb_tsportal_profile_search_index", using: :btree
    t.index ["user_id"], name: "tsdb_tsportal_profile_user_id_key", unique: true, using: :btree
    t.index ["user_organization_id"], name: "tsdb_tsportal_profile_user_organization_id", using: :btree
  end

  create_table "tsdb_tsportal_profile_iprange", force: :cascade do |t|
    t.integer "tsportal_profile_id", null: false
    t.integer "useriprange_id",      null: false
    t.index ["tsportal_profile_id", "useriprange_id"], name: "tsdb_tsportal_profile__tsportal_profile_id_80a2c8ed73cdd84_uniq", unique: true, using: :btree
    t.index ["tsportal_profile_id"], name: "tsdb_tsportal_profile_iprange_tsportal_profile_id", using: :btree
    t.index ["useriprange_id"], name: "tsdb_tsportal_profile_iprange_useriprange_id", using: :btree
  end

  create_table "tsdb_tsuseraction", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.datetime "created_ts",               null: false
    t.datetime "modified_ts",              null: false
    t.string   "action_type", limit: 30,   null: false
    t.integer  "r_type_id"
    t.integer  "r_id"
    t.string   "r_name",      limit: 1024
    t.index ["r_type_id"], name: "tsdb_tsuseraction_r_type_id", using: :btree
    t.index ["user_id"], name: "tsdb_tsuseraction_user_id", using: :btree
  end

  create_table "tsdb_tsvendorkey", force: :cascade do |t|
    t.integer "owner_org_id",            null: false
    t.integer "channel_id",              null: false
    t.text    "key",                     null: false
    t.string  "vendor_type",  limit: 80, null: false
    t.index ["channel_id"], name: "tsdb_tsvendorkey_channel_id", using: :btree
    t.index ["owner_org_id", "channel_id"], name: "tsdb_tsvendorkey_owner_org_id_channel_id_key", unique: true, using: :btree
    t.index ["owner_org_id"], name: "tsdb_tsvendorkey_owner_org_id", using: :btree
  end

  create_table "tsdb_tsworkgroup", force: :cascade do |t|
    t.string   "name",          limit: 50,  null: false
    t.integer  "owner_org_id",              null: false
    t.string   "avatar_s3_url", limit: 255
    t.datetime "created_ts",                null: false
    t.datetime "modified_ts",               null: false
    t.index ["name", "owner_org_id"], name: "tsdb_tsworkgroup_name_31c4867d006bd666_uniq", unique: true, using: :btree
    t.index ["owner_org_id"], name: "tsdb_tsworkgroup_owner_org_id", using: :btree
  end

  create_table "tsdb_tsworkgroupmember", force: :cascade do |t|
    t.integer "user_id",                 null: false
    t.integer "workgroup_id",            null: false
    t.string  "role",         limit: 50, null: false
    t.index ["user_id", "workgroup_id"], name: "tsdb_tsworkgroupmember_user_id_7200625231c31e1f_uniq", unique: true, using: :btree
    t.index ["user_id"], name: "tsdb_tsworkgroupmember_user_id", using: :btree
    t.index ["workgroup_id"], name: "tsdb_tsworkgroupmember_workgroup_id", using: :btree
  end

  create_table "tsdb_ttp", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.text     "description"
    t.integer  "organization_id",                null: false
    t.boolean  "is_public",                      null: false
    t.string   "tlp",                limit: 255
    t.datetime "created_ts",                     null: false
    t.datetime "modified_ts",                    null: false
    t.text     "tags",                                        array: true
    t.boolean  "is_category",                    null: false
    t.string   "publication_status", limit: 30,  null: false
    t.string   "producer",           limit: 25,  null: false
    t.string   "body_content_type",  limit: 10
    t.bigint   "feed_id",                        null: false
    t.index ["name", "organization_id"], name: "tsdb_ttp_name_264de0f7f3021169_uniq", unique: true, using: :btree
    t.index ["organization_id"], name: "tsdb_ttp_organization_id", using: :btree
  end

  create_table "tsdb_ttp_actors", force: :cascade do |t|
    t.integer "ttp_id",   null: false
    t.integer "actor_id", null: false
    t.index ["actor_id"], name: "tsdb_ttp_actors_actor_id", using: :btree
    t.index ["ttp_id", "actor_id"], name: "tsdb_ttp_actors_ttp_id_349cdfb6cb32c8d5_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_actors_ttp_id", using: :btree
  end

  create_table "tsdb_ttp_children", force: :cascade do |t|
    t.integer "from_ttp_id", null: false
    t.integer "to_ttp_id",   null: false
    t.index ["from_ttp_id", "to_ttp_id"], name: "tsdb_ttp_children_from_ttp_id_526bd5b6d1bcb030_uniq", unique: true, using: :btree
    t.index ["from_ttp_id"], name: "tsdb_ttp_children_from_ttp_id", using: :btree
    t.index ["to_ttp_id"], name: "tsdb_ttp_children_to_ttp_id", using: :btree
  end

  create_table "tsdb_ttp_circles", force: :cascade do |t|
    t.integer "ttp_id",           null: false
    t.integer "trustedcircle_id", null: false
    t.index ["trustedcircle_id"], name: "tsdb_ttp_circles_trustedcircle_id", using: :btree
    t.index ["ttp_id", "trustedcircle_id"], name: "tsdb_ttp_circles_ttp_id_4a65051c10b215eb_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_circles_ttp_id", using: :btree
  end

  create_table "tsdb_ttp_downvotes", force: :cascade do |t|
    t.integer "ttp_id",  null: false
    t.integer "user_id", null: false
    t.index ["ttp_id", "user_id"], name: "tsdb_ttp_downvotes_ttp_id_f8dda13a22ec4b0_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_downvotes_ttp_id", using: :btree
    t.index ["user_id"], name: "tsdb_ttp_downvotes_user_id", using: :btree
  end

  create_table "tsdb_ttp_intelligence", force: :cascade do |t|
    t.integer "ttp_id",           null: false
    t.integer "intelligence2_id", null: false
    t.index ["intelligence2_id"], name: "tsdb_ttp_intelligence_intelligence2_id", using: :btree
    t.index ["ttp_id", "intelligence2_id"], name: "tsdb_ttp_intelligence_ttp_id_575e4c6446f7e180_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_intelligence_ttp_id", using: :btree
  end

  create_table "tsdb_ttp_killchainstages", force: :cascade do |t|
    t.integer "ttp_id",            null: false
    t.integer "killchainstage_id", null: false
    t.index ["killchainstage_id"], name: "tsdb_ttp_killchainstages_killchainstage_id", using: :btree
    t.index ["ttp_id", "killchainstage_id"], name: "tsdb_ttp_killchainstages_ttp_id_1f2d7664a4bf3643_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_killchainstages_ttp_id", using: :btree
  end

  create_table "tsdb_ttp_signatures", force: :cascade do |t|
    t.integer "ttp_id",       null: false
    t.integer "signature_id", null: false
    t.index ["signature_id"], name: "tsdb_ttp_signatures_signature_id", using: :btree
    t.index ["ttp_id", "signature_id"], name: "tsdb_ttp_signatures_ttp_id_1f32862c0724cef5_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_signatures_ttp_id", using: :btree
  end

  create_table "tsdb_ttp_stars", force: :cascade do |t|
    t.integer "ttp_id",  null: false
    t.integer "user_id", null: false
    t.index ["ttp_id", "user_id"], name: "tsdb_ttp_stars_ttp_id_5f198460940b6628_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_stars_ttp_id", using: :btree
    t.index ["user_id"], name: "tsdb_ttp_stars_user_id", using: :btree
  end

  create_table "tsdb_ttp_upvotes", force: :cascade do |t|
    t.integer "ttp_id",  null: false
    t.integer "user_id", null: false
    t.index ["ttp_id", "user_id"], name: "tsdb_ttp_upvotes_ttp_id_6b99f59d115fd453_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_upvotes_ttp_id", using: :btree
    t.index ["user_id"], name: "tsdb_ttp_upvotes_user_id", using: :btree
  end

  create_table "tsdb_ttp_watching", force: :cascade do |t|
    t.integer "ttp_id",  null: false
    t.integer "user_id", null: false
    t.index ["ttp_id", "user_id"], name: "tsdb_ttp_watching_ttp_id_7e0a8c18301f7df9_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttp_watching_ttp_id", using: :btree
    t.index ["user_id"], name: "tsdb_ttp_watching_user_id", using: :btree
  end

  create_table "tsdb_ttpalias", force: :cascade do |t|
    t.string  "name",   limit: 100, null: false
    t.integer "ttp_id"
    t.index ["name", "ttp_id"], name: "tsdb_ttpalias_name_375730e7586b492a_uniq", unique: true, using: :btree
    t.index ["ttp_id"], name: "tsdb_ttpalias_ttp_id", using: :btree
  end

  create_table "tsdb_userchangehistory", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "changed_by_id", null: false
    t.boolean  "is_active",     null: false
    t.datetime "created_ts",    null: false
    t.index ["changed_by_id"], name: "tsdb_userchangehistory_changed_by_id", using: :btree
    t.index ["user_id"], name: "tsdb_userchangehistory_user_id", using: :btree
  end

  create_table "tsdb_useriprange", force: :cascade do |t|
    t.inet     "ip",       null: false
    t.date     "date",     null: false
    t.datetime "datetime"
    t.index ["ip"], name: "tsdb_useriprange_ip_key", unique: true, using: :btree
  end

  create_table "tsdb_userorganization", force: :cascade do |t|
    t.string   "title",                            limit: 100, null: false
    t.datetime "created_ts",                                   null: false
    t.datetime "modified_ts",                                  null: false
    t.boolean  "is_superuser",                                 null: false
    t.boolean  "is_active",                                    null: false
    t.string   "default_classification",           limit: 20,  null: false
    t.integer  "reseller_id"
    t.boolean  "is_tfa_enabled",                               null: false
    t.integer  "user_limit"
    t.string   "sales_status",                     limit: 50
    t.integer  "pdf_tip_intel_limit",                          null: false
    t.integer  "pdf_search_intel_limit",                       null: false
    t.integer  "identity_provider_id"
    t.boolean  "license_acknowledged",                         null: false
    t.datetime "exceeded_ts"
    t.integer  "session_timeout"
    t.string   "default_display_confidence",       limit: 25,  null: false
    t.string   "email_import_alias",               limit: 32
    t.text     "email_import_addresses",                                    array: true
    t.text     "upload_key",                                   null: false
    t.boolean  "create_es_index",                              null: false
    t.text     "reports_password"
    t.string   "customer_id",                      limit: 64
    t.json     "password_strength_requirements",               null: false
    t.boolean  "password_complexity_enabled",                  null: false
    t.boolean  "self_managed_users",                           null: false
    t.boolean  "use_s3_proxy",                                 null: false
    t.string   "reports_campaign_type",            limit: 20,  null: false
    t.integer  "pdf_investigation_entities_limit",             null: false
    t.string   "phishing_email_import_alias",      limit: 32
    t.boolean  "is_newnav_enabled",                            null: false
    t.index ["identity_provider_id"], name: "tsdb_userorganization_identity_provider_id", using: :btree
    t.index ["reseller_id"], name: "tsdb_userorganization_reseller_id", using: :btree
  end

  create_table "tsdb_userorganization_admins", force: :cascade do |t|
    t.integer "userorganization_id", null: false
    t.integer "user_id",             null: false
    t.index ["user_id"], name: "tsdb_userorganization_admins_user_id", using: :btree
    t.index ["userorganization_id", "user_id"], name: "tsdb_userorganization_userorganization_id_7580fe63862ba148_uniq", unique: true, using: :btree
    t.index ["userorganization_id"], name: "tsdb_userorganization_admins_userorganization_id", using: :btree
  end

  create_table "tsdb_userorganization_groups", force: :cascade do |t|
    t.integer "userorganization_id", null: false
    t.integer "group_id",            null: false
    t.index ["group_id"], name: "tsdb_userorganization_groups_group_id", using: :btree
    t.index ["userorganization_id", "group_id"], name: "tsdb_userorganization_userorganization_id_4241f973345d81ef_uniq", unique: true, using: :btree
    t.index ["userorganization_id"], name: "tsdb_userorganization_groups_userorganization_id", using: :btree
  end

  create_table "tsdb_userorganization_user_permissions", force: :cascade do |t|
    t.integer "userorganization_id", null: false
    t.integer "permission_id",       null: false
    t.index ["permission_id"], name: "tsdb_userorganization_user_permissions_permission_id", using: :btree
    t.index ["userorganization_id", "permission_id"], name: "tsdb_userorganization_userorganization_id_681366983b61dee0_uniq", unique: true, using: :btree
    t.index ["userorganization_id"], name: "tsdb_userorganization_user_permissions_userorganization_id", using: :btree
  end

  create_table "tsdb_victimtype", force: :cascade do |t|
    t.integer "value",             null: false
    t.string  "name",  limit: 100, null: false
  end

  create_table "tsdb_whitelist", force: :cascade do |t|
    t.string   "value",               limit: 2048, null: false
    t.string   "value_type",          limit: 15,   null: false
    t.integer  "added_by_user_id_id",              null: false
    t.datetime "created_ts",                       null: false
    t.datetime "modified_ts",                      null: false
    t.string   "notes",               limit: 400,  null: false
    t.index "value varchar_pattern_ops", name: "tsdb_whitelist_value_like", using: :btree
    t.index ["added_by_user_id_id"], name: "tsdb_whitelist_added_by_user_id_id", using: :btree
    t.index ["value"], name: "tsdb_whitelist_value_key", unique: true, using: :btree
  end

  create_table "utils_downloadrelatedperson", force: :cascade do |t|
    t.string   "name",    limit: 200, null: false
    t.string   "company", limit: 200, null: false
    t.string   "phone",   limit: 200, null: false
    t.string   "email",   limit: 200, null: false
    t.datetime "date",                null: false
  end

  add_foreign_key "Reports", "\"ClientApps\"", column: "ClientAppId", name: "Reports_ClientAppId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "advanced_comments_commentallowhiddenname", "django_comments", column: "comment_ptr_id", name: "advanced_comments_commentallowhiddenname_comment_ptr_id_fkey"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "group_id_refs_id_f4b32aac"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissions_permission_id_fkey"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_d043b34a"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_fkey"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "user_id_refs_id_40c41112"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permissions_permission_id_fkey"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "user_id_refs_id_4dc23c39"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_fkey"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_fkey"
  add_foreign_key "django_comment_flags", "auth_user", column: "user_id", name: "django_comment_flags_user_id_fkey"
  add_foreign_key "django_comment_flags", "django_comments", column: "comment_id", name: "django_comment_flags_comment_id_fkey"
  add_foreign_key "django_comments", "auth_user", column: "user_id", name: "django_comments_user_id_fkey"
  add_foreign_key "django_comments", "django_content_type", column: "content_type_id", name: "django_comments_content_type_id_fkey"
  add_foreign_key "django_comments", "django_site", column: "site_id", name: "django_comments_site_id_fkey"
  add_foreign_key "djcelery_periodictask", "djcelery_crontabschedule", column: "crontab_id", name: "crontab_id_refs_id_286da0d1"
  add_foreign_key "djcelery_periodictask", "djcelery_intervalschedule", column: "interval_id", name: "interval_id_refs_id_1829f358"
  add_foreign_key "djcelery_taskstate", "djcelery_workerstate", column: "worker_id", name: "worker_id_refs_id_6fd8ce95"
  add_foreign_key "intelligence", "tsdb_importdata", column: "import_session_id", name: "import_session_id_fk"
  add_foreign_key "intelligence", "tsdb_userorganization", column: "owner_organization_id", name: "intelligence_owner_organization_id_fk"
  add_foreign_key "intelligence_circles", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_e552f420"
  add_foreign_key "intelligence_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_692d75cb"
  add_foreign_key "intelligence_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_62ca7feb"
  add_foreign_key "intelligence_downvotes", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_43f5f65f"
  add_foreign_key "intelligence_stars", "auth_user", column: "user_id", name: "user_id_refs_id_ac4fbd86"
  add_foreign_key "intelligence_stars", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_c6073578"
  add_foreign_key "intelligence_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_b55cee76"
  add_foreign_key "intelligence_upvotes", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_920cc062"
  add_foreign_key "intelligence_watching", "auth_user", column: "user_id", name: "user_id_refs_id_76f4b2fc"
  add_foreign_key "intelligence_watching", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_06b9f030"
  add_foreign_key "registration_registrationprofile", "auth_user", column: "user_id", name: "registration_registrationprofile_user_id_fkey"
  add_foreign_key "signup_registration", "auth_user", column: "authorized_by_id", name: "authorized_by_id_refs_id_aff08f49"
  add_foreign_key "tastypie_apikey", "auth_user", column: "user_id", name: "user_id_refs_id_990aee10"
  add_foreign_key "trustedcircles_trustedcircle", "trustedcircles_trustedcircle", column: "premium_channel_id", name: "premium_channel_id_refs_id_a0df0ec6"
  add_foreign_key "trustedcircles_trustedcircle_admins", "auth_user", column: "user_id", name: "user_id_refs_id_dfdba3f8"
  add_foreign_key "trustedcircles_trustedcircle_admins", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_eec6316f"
  add_foreign_key "trustedcircles_trustedcircle_members", "auth_user", column: "approved_by_id", name: "approved_by_id_refs_id_000bbfe9"
  add_foreign_key "trustedcircles_trustedcircle_members", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_56696b9b"
  add_foreign_key "trustedcircles_trustedcircle_members", "tsdb_userorganization", column: "userorganization_id", name: "userorganization_id_refs_id_c36a69d6"
  add_foreign_key "trustedcircles_trustedcircleinvite", "auth_user", column: "inviter_id", name: "inviter_id_refs_id_0bbc026d"
  add_foreign_key "trustedcircles_trustedcircleinvite", "trustedcircles_trustedcircle", column: "circle_id", name: "circle_id_refs_id_dae904a1"
  add_foreign_key "tsdb_activitydaterange", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_aa073dd4"
  add_foreign_key "tsdb_activitydaterange", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_ade4d59e"
  add_foreign_key "tsdb_actor", "tsdb_actor", column: "parent_id", name: "parent_id_refs_id_4004caf4"
  add_foreign_key "tsdb_actor", "tsdb_actorsophisticationtype", column: "soph_type_id", name: "soph_type_id_refs_id_e196e9de"
  add_foreign_key "tsdb_actor", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_f0da1f64"
  add_foreign_key "tsdb_actor_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_34cff5bb"
  add_foreign_key "tsdb_actor_circles", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_6db069d5"
  add_foreign_key "tsdb_actor_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_52443617"
  add_foreign_key "tsdb_actor_downvotes", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_fb3a1bb1"
  add_foreign_key "tsdb_actor_intelligence", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_0533a0ab"
  add_foreign_key "tsdb_actor_intelligence", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_05e4d03e"
  add_foreign_key "tsdb_actor_signatures", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_d9be10a3"
  add_foreign_key "tsdb_actor_signatures", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_b7703d86"
  add_foreign_key "tsdb_actor_stars", "auth_user", column: "user_id", name: "user_id_refs_id_7369cb3f"
  add_foreign_key "tsdb_actor_stars", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_af8b7cc5"
  add_foreign_key "tsdb_actor_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_d8660fe6"
  add_foreign_key "tsdb_actor_upvotes", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_1f1240fb"
  add_foreign_key "tsdb_actor_victims", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_d6d4271e"
  add_foreign_key "tsdb_actor_victims", "tsdb_victimtype", column: "victimtype_id", name: "victimtype_id_refs_id_2d4f3657"
  add_foreign_key "tsdb_actor_watching", "auth_user", column: "user_id", name: "user_id_refs_id_697c1a11"
  add_foreign_key "tsdb_actor_watching", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_f32b0113"
  add_foreign_key "tsdb_actoralias", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_ff3300df"
  add_foreign_key "tsdb_actormotivation", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_81ef5721"
  add_foreign_key "tsdb_actormotivation", "tsdb_actormotivationtype", column: "m_type_id", name: "m_type_id_refs_id_8647ea81"
  add_foreign_key "tsdb_actortracking", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_31a0d8c4"
  add_foreign_key "tsdb_actortypestatement", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_a07151d9"
  add_foreign_key "tsdb_actortypestatement", "tsdb_actortype", column: "a_type_id", name: "a_type_id_refs_id_b94ba905"
  add_foreign_key "tsdb_anomalilink_organizations", "tsdb_anomalilink", column: "anomalilink_id", name: "anomalilink_id_refs_id_0ad52992"
  add_foreign_key "tsdb_anomalilink_organizations", "tsdb_userorganization", column: "userorganization_id", name: "tsdb_anomalilink_organizations_userorganization_id_fkey"
  add_foreign_key "tsdb_anomalilinkprofile", "auth_user", column: "user_id", name: "tsdb_anomalilinkprofile_user_id_fkey"
  add_foreign_key "tsdb_asyncreport", "auth_user", column: "user_id", name: "user_id_refs_id_fa57a2a2"
  add_foreign_key "tsdb_behaviorattackpattern", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_7d3a9248"
  add_foreign_key "tsdb_behaviorexploit", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_9485358c"
  add_foreign_key "tsdb_behaviormalware", "tsdb_malwaretype", column: "m_type_id", name: "m_type_id_refs_id_218c45c3"
  add_foreign_key "tsdb_behaviormalware", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_d826debc"
  add_foreign_key "tsdb_campaign", "tsdb_campaign", column: "parent_id", name: "parent_id_refs_id_b09c4cee"
  add_foreign_key "tsdb_campaign", "tsdb_campaignstatus", column: "status_id", name: "status_id_refs_id_f5f7c8f5"
  add_foreign_key "tsdb_campaign", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_b83320ae"
  add_foreign_key "tsdb_campaign_actors", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_442aec5c"
  add_foreign_key "tsdb_campaign_actors", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_4ce1c81c"
  add_foreign_key "tsdb_campaign_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_0d475e22"
  add_foreign_key "tsdb_campaign_circles", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_4ac66f03"
  add_foreign_key "tsdb_campaign_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_126792c6"
  add_foreign_key "tsdb_campaign_downvotes", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_1960069a"
  add_foreign_key "tsdb_campaign_incidents", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_5489430b"
  add_foreign_key "tsdb_campaign_incidents", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_f62f0233"
  add_foreign_key "tsdb_campaign_intelligence", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_75eca16e"
  add_foreign_key "tsdb_campaign_intelligence", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_b51de1d8"
  add_foreign_key "tsdb_campaign_signatures", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_1f4d2395"
  add_foreign_key "tsdb_campaign_signatures", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_4260633e"
  add_foreign_key "tsdb_campaign_stars", "auth_user", column: "user_id", name: "user_id_refs_id_667666f9"
  add_foreign_key "tsdb_campaign_stars", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_c9d5f0e0"
  add_foreign_key "tsdb_campaign_ttps", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_9aaca949"
  add_foreign_key "tsdb_campaign_ttps", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_beec61d4"
  add_foreign_key "tsdb_campaign_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_baeb66f8"
  add_foreign_key "tsdb_campaign_upvotes", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_700ed7b6"
  add_foreign_key "tsdb_campaign_victims", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_cce71d5d"
  add_foreign_key "tsdb_campaign_victims", "tsdb_victimtype", column: "victimtype_id", name: "victimtype_id_refs_id_d0bbf05b"
  add_foreign_key "tsdb_campaign_watching", "auth_user", column: "user_id", name: "user_id_refs_id_f0fd0734"
  add_foreign_key "tsdb_campaign_watching", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_a57ca9ac"
  add_foreign_key "tsdb_campaignalias", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_1856d3a7"
  add_foreign_key "tsdb_comment", "auth_user", column: "user_id", name: "user_id_refs_id_84ba4193"
  add_foreign_key "tsdb_comment_intelligences", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_976b78d4"
  add_foreign_key "tsdb_comment_intelligences", "tsdb_comment", column: "comment_id", name: "comment_id_refs_id_8883919e"
  add_foreign_key "tsdb_controlledaccessintegration", "auth_user", column: "user_id", name: "user_id_refs_id_db8697f0"
  add_foreign_key "tsdb_coupon", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_03c4b66f"
  add_foreign_key "tsdb_cuckooreportfile", "tsdb_reportedfile", column: "submit_id", name: "submit_id_refs_id_661c0b3f"
  add_foreign_key "tsdb_dashboard", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_ad668fc1"
  add_foreign_key "tsdb_dashboardreportconfiguration", "tsdb_dashboard", column: "dashboard_id", name: "dashboard_id_refs_id_67087b53"
  add_foreign_key "tsdb_dashboardreportconfiguration", "tsdb_reportconfiguration", column: "report_configuration_id", name: "report_configuration_id_refs_id_cdc1e0bd"
  add_foreign_key "tsdb_datacollectorstatus", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_953a2002"
  add_foreign_key "tsdb_defaulttemplate", "django_content_type", column: "model_id", name: "model_id_refs_id_1c57957f"
  add_foreign_key "tsdb_defaulttemplate", "tsdb_texttemplate", column: "template_id", name: "template_id_refs_id_15347126"
  add_foreign_key "tsdb_defaulttemplate", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_5ca8f58d"
  add_foreign_key "tsdb_exportfileasync", "auth_user", column: "user_id", name: "tsdb_exportfileasync_user_id_fkey"
  add_foreign_key "tsdb_exportstixdata", "auth_user", column: "user_id", name: "user_id_refs_id_3f6633df"
  add_foreign_key "tsdb_falsepos", "auth_user", column: "username_id", name: "username_id_refs_id_893be17d"
  add_foreign_key "tsdb_falsepos", "intelligence", name: "intelligence_id_refs_id_820beda3"
  add_foreign_key "tsdb_feedgroup_feeds", "tsdb_feedgroup", column: "feedgroup_id", name: "feedgroup_id_refs_id_81e97ab2"
  add_foreign_key "tsdb_feedgroup_feeds", "tsdb_feeds", column: "feeds_id", name: "feeds_id_refs_id_fbd2c09e"
  add_foreign_key "tsdb_feedgroupsubscription", "tsdb_feedgroup", column: "feed_group_id", name: "feed_group_id_refs_id_4499abdf"
  add_foreign_key "tsdb_feedgroupsubscription", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_06a20c38"
  add_foreign_key "tsdb_feeds", "auth_user", column: "reported_by_user_id", name: "reported_by_user_id_refs_id_636718cb"
  add_foreign_key "tsdb_feeds", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_fc7bafa4"
  add_foreign_key "tsdb_feeds_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_33de93be"
  add_foreign_key "tsdb_feeds_circles", "tsdb_feeds", column: "feeds_id", name: "feeds_id_refs_id_9011616f"
  add_foreign_key "tsdb_importdata", "auth_user", column: "approved_by_id", name: "approved_by_id_refs_id_af38e606"
  add_foreign_key "tsdb_importdata", "auth_user", column: "user_id", name: "user_id_refs_id_af38e606"
  add_foreign_key "tsdb_importdata", "tsdb_comment", column: "default_comment_id", name: "default_comment_id_refs_id_b346cf9a"
  add_foreign_key "tsdb_importdata", "tsdb_reportedfile", column: "sandbox_submit_id", name: "sandbox_submit_id_refs_id_c03cecae"
  add_foreign_key "tsdb_importdata", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_8f684446"
  add_foreign_key "tsdb_importdata_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_5d0c3bde"
  add_foreign_key "tsdb_importdata_circles", "tsdb_importdata", column: "importdata_id", name: "importdata_id_refs_id_af4e86cd"
  add_foreign_key "tsdb_importstixdata", "auth_user", column: "user_id", name: "user_id_refs_id_f30a8eb8"
  add_foreign_key "tsdb_importstixdata", "tsdb_importdata", column: "import_session_id", name: "import_session_id_refs_id_b3e5df14"
  add_foreign_key "tsdb_importstixdata", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_f4ab6527"
  add_foreign_key "tsdb_incident", "tsdb_incident", column: "parent_id", name: "parent_id_refs_id_f1847d5e"
  add_foreign_key "tsdb_incident", "tsdb_incidentstatus", column: "status_id", name: "status_id_refs_id_9ee74fb2"
  add_foreign_key "tsdb_incident", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_abf795d8"
  add_foreign_key "tsdb_incident_actors", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_cef101e0"
  add_foreign_key "tsdb_incident_actors", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_217575ed"
  add_foreign_key "tsdb_incident_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_b2e520f3"
  add_foreign_key "tsdb_incident_circles", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_a8d58c87"
  add_foreign_key "tsdb_incident_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_e27fb400"
  add_foreign_key "tsdb_incident_downvotes", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_0b757a58"
  add_foreign_key "tsdb_incident_intelligence", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_e7429325"
  add_foreign_key "tsdb_incident_intelligence", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_46bdceda"
  add_foreign_key "tsdb_incident_sandbox_reports", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_4c724a99"
  add_foreign_key "tsdb_incident_sandbox_reports", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_d88c9a40"
  add_foreign_key "tsdb_incident_signatures", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_30a27242"
  add_foreign_key "tsdb_incident_signatures", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_fa9f35ee"
  add_foreign_key "tsdb_incident_stars", "auth_user", column: "user_id", name: "user_id_refs_id_ce252225"
  add_foreign_key "tsdb_incident_stars", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_795b37c8"
  add_foreign_key "tsdb_incident_ttps", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_2ca133bc"
  add_foreign_key "tsdb_incident_ttps", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_e6be4fef"
  add_foreign_key "tsdb_incident_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_c3cc1e09"
  add_foreign_key "tsdb_incident_upvotes", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_cb91c6d1"
  add_foreign_key "tsdb_incident_victims", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_274f25d2"
  add_foreign_key "tsdb_incident_victims", "tsdb_victimtype", column: "victimtype_id", name: "victimtype_id_refs_id_18b982ed"
  add_foreign_key "tsdb_incident_watching", "auth_user", column: "user_id", name: "user_id_refs_id_6d7613f0"
  add_foreign_key "tsdb_incident_watching", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_313cac6c"
  add_foreign_key "tsdb_incidentassignment", "auth_user", column: "assignee_user_id", name: "assignee_user_id_refs_id_27fbb7bc"
  add_foreign_key "tsdb_incidentassignment", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_c03c73d6"
  add_foreign_key "tsdb_incidentassignment", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_075db5d8"
  add_foreign_key "tsdb_integration", "tsdb_userorganization", column: "owner_organization_id", name: "owner_organization_id_refs_id_31a45179"
  add_foreign_key "tsdb_intelimportrejection", "auth_user", column: "user_importer_id", name: "user_importer_id_refs_id_95f39e40"
  add_foreign_key "tsdb_intelimportrejection", "tsdb_importdata", column: "import_session_id", name: "import_session_id_refs_id_922b6d2f"
  add_foreign_key "tsdb_intelimportrejection", "tsdb_userorganization", column: "owner_organization_id", name: "owner_organization_id_refs_id_e1b01ae8"
  add_foreign_key "tsdb_intelimportrejection_actors", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_9ec60930"
  add_foreign_key "tsdb_intelimportrejection_actors", "tsdb_intelimportrejection", column: "intelimportrejection_id", name: "intelimportrejection_id_refs_id_1d97500a"
  add_foreign_key "tsdb_intelimportrejection_campaigns", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_ca8a4b03"
  add_foreign_key "tsdb_intelimportrejection_campaigns", "tsdb_intelimportrejection", column: "intelimportrejection_id", name: "intelimportrejection_id_refs_id_73b09b40"
  add_foreign_key "tsdb_intelimportrejection_incidents", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_c6f84dda"
  add_foreign_key "tsdb_intelimportrejection_incidents", "tsdb_intelimportrejection", column: "intelimportrejection_id", name: "intelimportrejection_id_refs_id_41e7071c"
  add_foreign_key "tsdb_intelimportrejection_tip_reports", "tsdb_intelimportrejection", column: "intelimportrejection_id", name: "intelimportrejection_id_refs_id_f762ad74"
  add_foreign_key "tsdb_intelimportrejection_tip_reports", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_4ac0dcb0"
  add_foreign_key "tsdb_intelimportrejection_ttps", "tsdb_intelimportrejection", column: "intelimportrejection_id", name: "intelimportrejection_id_refs_id_3e864c6e"
  add_foreign_key "tsdb_intelimportrejection_ttps", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_5af6af9d"
  add_foreign_key "tsdb_intelligence", "auth_user", column: "owner_user_id", name: "owner_user_id_refs_id_d90e9a6f"
  add_foreign_key "tsdb_intelligence", "tsdb_feeds", column: "source_feed_obj_id", name: "source_feed_obj_id_refs_id_f6f19554"
  add_foreign_key "tsdb_intelligence", "tsdb_importdata", column: "import_session_id", name: "import_session_id_refs_id_f7d79c5b"
  add_foreign_key "tsdb_intelligence", "tsdb_userorganization", column: "owner_organization_id", name: "owner_organization_id_refs_id_03c52653"
  add_foreign_key "tsdb_intelligence_circles", "intelligence", name: "intelligence_id_refs_id_6b085108"
  add_foreign_key "tsdb_intelligence_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_edb30678"
  add_foreign_key "tsdb_intelligencehistory", "auth_user", column: "user_id", name: "user_id_refs_id_58adc017"
  add_foreign_key "tsdb_intelligencehistory", "intelligence", name: "intelligence_id_refs_id_6b8634c3"
  add_foreign_key "tsdb_intendedeffect", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_347f85ad"
  add_foreign_key "tsdb_intendedeffect", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_63a9114e"
  add_foreign_key "tsdb_intendedeffect", "tsdb_intendedeffecttype", column: "i_type_id", name: "i_type_id_refs_id_b09e5d0c"
  add_foreign_key "tsdb_keywordalertmatch", "intelligence", column: "intel_id", name: "intel_id_refs_id_2e944196"
  add_foreign_key "tsdb_keywordalertmatch", "tsdb_reportedfile", column: "report_id", name: "report_id_refs_id_2638b62b"
  add_foreign_key "tsdb_keywordalertmatch", "tsdb_tipreport", column: "tip_id", name: "tip_id_refs_id_ab02140d"
  add_foreign_key "tsdb_keywordalertmatch", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_8cc64085"
  add_foreign_key "tsdb_lineitem", "django_content_type", column: "item_type_id", name: "item_type_id_refs_id_3088bb0a"
  add_foreign_key "tsdb_lineitem", "tsdb_order", column: "order_id", name: "order_id_refs_id_04c312a9"
  add_foreign_key "tsdb_myattacks", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_fc716569"
  add_foreign_key "tsdb_opticlink_organizations", "tsdb_opticlink", column: "opticlink_id", name: "opticlink_id_refs_id_f5c3f49c"
  add_foreign_key "tsdb_opticlink_organizations", "tsdb_userorganization", column: "userorganization_id", name: "userorganization_id_refs_id_e702930c"
  add_foreign_key "tsdb_opticlinkprofile", "auth_user", column: "user_id", name: "user_id_refs_id_c810f404"
  add_foreign_key "tsdb_order", "auth_user", column: "user_id", name: "user_id_refs_id_ef9884ac"
  add_foreign_key "tsdb_order", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_94eaa311"
  add_foreign_key "tsdb_orgalertkeyword", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_9a53abac"
  add_foreign_key "tsdb_orgemail", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_ed44aa21"
  add_foreign_key "tsdb_orgwhitelist", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_bdcbf6dc"
  add_foreign_key "tsdb_payment", "auth_user", column: "user_id", name: "user_id_refs_id_9c9bcce3"
  add_foreign_key "tsdb_payment", "tsdb_order", column: "order_id", name: "order_id_refs_id_c95eaa64"
  add_foreign_key "tsdb_payment", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_7f833c02"
  add_foreign_key "tsdb_privatecase", "django_content_type", column: "threat_model_type_id", name: "threat_model_type_id_refs_id_ad34df40"
  add_foreign_key "tsdb_privatecase", "tsdb_privatestatus", column: "case_status_id", name: "case_status_id_refs_id_78e56a0b"
  add_foreign_key "tsdb_privatecase", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_748154c2"
  add_foreign_key "tsdb_privatestatus", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_1c8db53f"
  add_foreign_key "tsdb_report", "auth_user", column: "user_id", name: "user_id_refs_id_443e50ec"
  add_foreign_key "tsdb_report", "tsdb_reportconfiguration", column: "report_configuration_id", name: "report_configuration_id_refs_id_7a4bc648"
  add_foreign_key "tsdb_report", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_0ac7ebd3"
  add_foreign_key "tsdb_reportedfile", "auth_user", column: "user_id", name: "user_id_refs_id_0381a01c"
  add_foreign_key "tsdb_reportedfile_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_02a7b4a9"
  add_foreign_key "tsdb_reportedfile_circles", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_d7ec07da"
  add_foreign_key "tsdb_reportedfile_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_c0dd614f"
  add_foreign_key "tsdb_reportedfile_downvotes", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_7fb5b4f7"
  add_foreign_key "tsdb_reportedfile_stars", "auth_user", column: "user_id", name: "user_id_refs_id_8d59af9c"
  add_foreign_key "tsdb_reportedfile_stars", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_06b2c2da"
  add_foreign_key "tsdb_reportedfile_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_92a9fe50"
  add_foreign_key "tsdb_reportedfile_upvotes", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_14b9972f"
  add_foreign_key "tsdb_reportedfile_watching", "auth_user", column: "user_id", name: "user_id_refs_id_21b1a73d"
  add_foreign_key "tsdb_reportedfile_watching", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_9b6a1840"
  add_foreign_key "tsdb_reportedfilecomment", "auth_user", column: "user_id", name: "user_id_refs_id_279612c6"
  add_foreign_key "tsdb_reportedfilecomment_reported_files", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_665e4405"
  add_foreign_key "tsdb_reportedfilecomment_reported_files", "tsdb_reportedfilecomment", column: "reportedfilecomment_id", name: "reportedfilecomment_id_refs_id_bbce6268"
  add_foreign_key "tsdb_reportsubscription", "tsdb_reportsubscriptionplan", column: "plan_id", name: "plan_id_refs_id_6e973e5e"
  add_foreign_key "tsdb_reportsubscription", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_afb00176"
  add_foreign_key "tsdb_reportsubscriptionplan", "tsdb_reportconfiguration", column: "report_configuration_id", name: "report_configuration_id_refs_id_37a66538"
  add_foreign_key "tsdb_reportsubscriptionplan", "tsdb_reportsubscriptionplan", column: "expire_downgrade_id", name: "expire_downgrade_id_refs_id_418888cc"
  add_foreign_key "tsdb_reseller", "auth_group", column: "permissions_group_id", name: "permissions_group_id_refs_id_f352b086"
  add_foreign_key "tsdb_reseller_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_8687602e"
  add_foreign_key "tsdb_reseller_circles", "tsdb_reseller", column: "reseller_id", name: "reseller_id_refs_id_fb98730f"
  add_foreign_key "tsdb_searchfilter", "auth_user", column: "created_by_user_id", name: "created_by_user_id_refs_id_49b8c201"
  add_foreign_key "tsdb_searchfilter", "tsdb_userorganization", column: "org_id", name: "org_id_refs_id_c41352c2"
  add_foreign_key "tsdb_signature", "tsdb_signaturetype", column: "s_type_id", name: "s_type_id_refs_id_31ee83b9"
  add_foreign_key "tsdb_signature", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_1e92981e"
  add_foreign_key "tsdb_signature_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_bb92705a"
  add_foreign_key "tsdb_signature_circles", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_cea471c0"
  add_foreign_key "tsdb_signature_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_7186ea14"
  add_foreign_key "tsdb_signature_downvotes", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_eed64027"
  add_foreign_key "tsdb_signature_stars", "auth_user", column: "user_id", name: "user_id_refs_id_92e6fd49"
  add_foreign_key "tsdb_signature_stars", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_8734d841"
  add_foreign_key "tsdb_signature_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_7bed1a11"
  add_foreign_key "tsdb_signature_upvotes", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_c76db1b6"
  add_foreign_key "tsdb_signature_watching", "auth_user", column: "user_id", name: "user_id_refs_id_f8f55fcc"
  add_foreign_key "tsdb_signature_watching", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_d7c8df79"
  add_foreign_key "tsdb_sku", "django_content_type", column: "old_product_type_id", name: "old_product_type_id_refs_id_77d38101"
  add_foreign_key "tsdb_sku", "django_content_type", column: "product_type_id", name: "product_type_id_refs_id_77d38101"
  add_foreign_key "tsdb_snapshot", "tsdb_userorganization", column: "owner_organization_id", name: "owner_organization_id_refs_id_9b9e1ff9"
  add_foreign_key "tsdb_stixcomment", "auth_user", column: "user_id", name: "user_id_refs_id_43ae1f22"
  add_foreign_key "tsdb_stixcomment", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_ae9205b2"
  add_foreign_key "tsdb_stixcomment", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_1d8c3b31"
  add_foreign_key "tsdb_stixcomment", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_b6803822"
  add_foreign_key "tsdb_stixcomment", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_43478ecb"
  add_foreign_key "tsdb_stixcomment", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_5885245b"
  add_foreign_key "tsdb_stixexternalreference", "tsdb_campaign", column: "campaign_id", name: "campaign_id_refs_id_c58e8859"
  add_foreign_key "tsdb_stixexternalreference", "tsdb_incident", column: "incident_id", name: "incident_id_refs_id_70f63687"
  add_foreign_key "tsdb_taxiisite", "auth_user", column: "created_by_user_id", name: "created_by_user_id_refs_id_bd4afdcc"
  add_foreign_key "tsdb_taxiisite", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_7add6dab"
  add_foreign_key "tsdb_taxiitaskactivity", "tsdb_taxiitaskconfiguration", column: "task_id", name: "task_id_refs_id_a676e16d"
  add_foreign_key "tsdb_taxiitaskconfiguration", "auth_user", column: "created_by_user_id", name: "created_by_user_id_refs_id_19a0e6ff"
  add_foreign_key "tsdb_taxiitaskconfiguration", "djcelery_periodictask", column: "schedule_id", name: "schedule_id_refs_id_24ce4108"
  add_foreign_key "tsdb_taxiitaskconfiguration", "tsdb_feeds", column: "inbox_id", name: "inbox_id_refs_id_f8e71672"
  add_foreign_key "tsdb_taxiitaskconfiguration", "tsdb_searchfilter", column: "search_filter_id", name: "search_filter_id_refs_id_56524b20"
  add_foreign_key "tsdb_taxiitaskconfiguration", "tsdb_taxiisite", column: "taxii_site_id", name: "taxii_site_id_refs_id_5be15edc"
  add_foreign_key "tsdb_taxiitaskconfiguration", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_d59a61c8"
  add_foreign_key "tsdb_texttemplate", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_b99660d7"
  add_foreign_key "tsdb_threatmodelhistory", "tsdb_actor", column: "actor_id", name: "tsdb_threatmodelhistory_actor_id_fkey"
  add_foreign_key "tsdb_threatmodelhistory", "tsdb_campaign", column: "campaign_id", name: "tsdb_threatmodelhistory_campaign_id_fkey"
  add_foreign_key "tsdb_threatmodelhistory", "tsdb_incident", column: "incident_id", name: "tsdb_threatmodelhistory_incident_id_fkey"
  add_foreign_key "tsdb_threatmodelhistory", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_fcec0076"
  add_foreign_key "tsdb_threatmodelhistory", "tsdb_ttp", column: "ttp_id", name: "tsdb_threatmodelhistory_ttp_id_fkey"
  add_foreign_key "tsdb_tipattachment", "auth_user", column: "user_id", name: "user_id_refs_id_04e7516b"
  add_foreign_key "tsdb_tipattachment", "tsdb_tipreport", column: "tip_report_id", name: "tip_report_id_refs_id_04381c44"
  add_foreign_key "tsdb_tipcomment", "auth_user", column: "user_id", name: "user_id_refs_id_b208239a"
  add_foreign_key "tsdb_tipcomment", "tsdb_tipreport", column: "tip_report_id", name: "tip_report_id_refs_id_bb17fa8a"
  add_foreign_key "tsdb_tiphistory", "auth_user", column: "user_id", name: "user_id_refs_id_dc0a5d65"
  add_foreign_key "tsdb_tiphistory", "tsdb_tipreport", column: "tip_report_id", name: "tip_report_id_refs_id_c4dde05b"
  add_foreign_key "tsdb_tipreport", "auth_user", column: "assignee_user_id", name: "assignee_user_id_refs_id_e064b1f3"
  add_foreign_key "tsdb_tipreport", "auth_user", column: "owner_user_id", name: "owner_user_id_refs_id_e064b1f3"
  add_foreign_key "tsdb_tipreport", "tsdb_tipreport", column: "parent_id", name: "parent_id_refs_id_05336210"
  add_foreign_key "tsdb_tipreport", "tsdb_userorganization", column: "assignee_org_id", name: "assignee_org_id_refs_id_d57031dc"
  add_foreign_key "tsdb_tipreport", "tsdb_userorganization", column: "owner_org_id", name: "owner_org_id_refs_id_d57031dc"
  add_foreign_key "tsdb_tipreport_actors", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_43443584"
  add_foreign_key "tsdb_tipreport_actors", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_d470bf18"
  add_foreign_key "tsdb_tipreport_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_07b514b3"
  add_foreign_key "tsdb_tipreport_circles", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_5b826de6"
  add_foreign_key "tsdb_tipreport_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_c00a3d7c"
  add_foreign_key "tsdb_tipreport_downvotes", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_ed7ae717"
  add_foreign_key "tsdb_tipreport_import_sessions", "tsdb_importdata", column: "importdata_id", name: "importdata_id_refs_id_f489f37e"
  add_foreign_key "tsdb_tipreport_import_sessions", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_32b4b873"
  add_foreign_key "tsdb_tipreport_intelligence", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_9e9f7c64"
  add_foreign_key "tsdb_tipreport_intelligence", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_3377f475"
  add_foreign_key "tsdb_tipreport_sandbox_reports", "tsdb_reportedfile", column: "reportedfile_id", name: "reportedfile_id_refs_id_10abbd84"
  add_foreign_key "tsdb_tipreport_sandbox_reports", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_e5a3a76e"
  add_foreign_key "tsdb_tipreport_stars", "auth_user", column: "user_id", name: "user_id_refs_id_c99bf855"
  add_foreign_key "tsdb_tipreport_stars", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_692cc0e7"
  add_foreign_key "tsdb_tipreport_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_ecfd9c92"
  add_foreign_key "tsdb_tipreport_upvotes", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_74a8821a"
  add_foreign_key "tsdb_tipreport_watching", "auth_user", column: "user_id", name: "user_id_refs_id_0a757b1c"
  add_foreign_key "tsdb_tipreport_watching", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_672c7e54"
  add_foreign_key "tsdb_tsapiuseraction", "auth_user", column: "user_id", name: "user_id_refs_id_c8d592f5"
  add_foreign_key "tsdb_tsbadgeassignment", "auth_user", column: "user_id", name: "user_id_refs_id_ab25a19b"
  add_foreign_key "tsdb_tsbadgeassignment", "tsdb_tsbadgedefinition", column: "badge_id", name: "badge_id_refs_id_4460d796"
  add_foreign_key "tsdb_tsinvestigation", "auth_user", column: "reporter_id", name: "reporter_id_refs_id_f93d7fea"
  add_foreign_key "tsdb_tsinvestigation", "django_content_type", column: "assignee_type_id", name: "assignee_type_id_refs_id_237bda1e"
  add_foreign_key "tsdb_tsinvestigation", "tsdb_userorganization", column: "owner_org_id", name: "owner_org_id_refs_id_e1eea6ca"
  add_foreign_key "tsdb_tsinvestigation_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_58595590"
  add_foreign_key "tsdb_tsinvestigation_circles", "tsdb_tsinvestigation", column: "tsinvestigation_id", name: "tsinvestigation_id_refs_id_de511956"
  add_foreign_key "tsdb_tsinvestigation_tips", "tsdb_tipreport", column: "tipreport_id", name: "tipreport_id_refs_id_c5f22072"
  add_foreign_key "tsdb_tsinvestigation_tips", "tsdb_tsinvestigation", column: "tsinvestigation_id", name: "tsinvestigation_id_refs_id_2595b0b5"
  add_foreign_key "tsdb_tsinvestigationanalysis", "auth_user", column: "user_id", name: "user_id_refs_id_346a2f0b"
  add_foreign_key "tsdb_tsinvestigationanalysis", "tsdb_tsinvestigation", column: "investigation_id", name: "investigation_id_refs_id_67040776"
  add_foreign_key "tsdb_tsinvestigationanalysis_elements", "tsdb_tsinvestigationanalysis", column: "tsinvestigationanalysis_id", name: "tsinvestigationanalysis_id_refs_id_f1118378"
  add_foreign_key "tsdb_tsinvestigationanalysis_elements", "tsdb_tsinvestigationelement", column: "tsinvestigationelement_id", name: "tsinvestigationelement_id_refs_id_bb0f2b4a"
  add_foreign_key "tsdb_tsinvestigationanalysis_parents", "tsdb_tsinvestigationanalysis", column: "from_tsinvestigationanalysis_id", name: "from_tsinvestigationanalysis_id_refs_id_6c3ad26e"
  add_foreign_key "tsdb_tsinvestigationanalysis_parents", "tsdb_tsinvestigationanalysis", column: "to_tsinvestigationanalysis_id", name: "to_tsinvestigationanalysis_id_refs_id_6c3ad26e"
  add_foreign_key "tsdb_tsinvestigationelement", "django_content_type", column: "r_type_id", name: "r_type_id_refs_id_5f7efe8e"
  add_foreign_key "tsdb_tsinvestigationelement", "tsdb_tsinvestigation", column: "investigation_id", name: "investigation_id_refs_id_226f952b"
  add_foreign_key "tsdb_tsinvestigationelement_parents", "tsdb_tsinvestigationelement", column: "from_tsinvestigationelement_id", name: "from_tsinvestigationelement_id_refs_id_c24a047c"
  add_foreign_key "tsdb_tsinvestigationelement_parents", "tsdb_tsinvestigationelement", column: "to_tsinvestigationelement_id", name: "to_tsinvestigationelement_id_refs_id_c24a047c"
  add_foreign_key "tsdb_tsinvestigationhistory", "auth_user", column: "user_id", name: "user_id_refs_id_d1d1a3f5"
  add_foreign_key "tsdb_tsinvestigationhistory", "tsdb_tsinvestigation", column: "investigation_id", name: "investigation_id_refs_id_2853828a"
  add_foreign_key "tsdb_tsinvestigationtag", "auth_user", column: "user_id", name: "user_id_refs_id_23a62542"
  add_foreign_key "tsdb_tsinvestigationtag", "tsdb_tsinvestigation", column: "investigation_id", name: "investigation_id_refs_id_406b94a3"
  add_foreign_key "tsdb_tsinvestigationtag_elements", "tsdb_tsinvestigationelement", column: "tsinvestigationelement_id", name: "tsinvestigationelement_id_refs_id_e083978c"
  add_foreign_key "tsdb_tsinvestigationtag_elements", "tsdb_tsinvestigationtag", column: "tsinvestigationtag_id", name: "tsinvestigationtag_id_refs_id_bd986b51"
  add_foreign_key "tsdb_tsinvestigationtask", "auth_user", column: "created_by_id", name: "created_by_id_refs_id_855e795b"
  add_foreign_key "tsdb_tsinvestigationtask", "django_content_type", column: "assignee_type_id", name: "assignee_type_id_refs_id_836d8e77"
  add_foreign_key "tsdb_tsinvestigationtask", "tsdb_tsinvestigation", column: "investigation_id", name: "investigation_id_refs_id_c45b381a"
  add_foreign_key "tsdb_tsinvestigationtasknote", "auth_user", column: "user_id", name: "user_id_refs_id_702f347b"
  add_foreign_key "tsdb_tsinvestigationtasknote", "tsdb_tsinvestigationtask", column: "task_id", name: "task_id_refs_id_f0f61382"
  add_foreign_key "tsdb_tsitemshare", "auth_user", column: "user_sharing_id", name: "user_sharing_id_refs_id_fdffde2d"
  add_foreign_key "tsdb_tsitemshare", "django_content_type", column: "r_type_id", name: "r_type_id_refs_id_e6ecad68"
  add_foreign_key "tsdb_tsnotification", "auth_user", column: "action_user_id", name: "action_user_id_refs_id_0e6148db"
  add_foreign_key "tsdb_tsnotification", "django_content_type", column: "owner_type_id", name: "owner_type_id_refs_id_d219ccc0"
  add_foreign_key "tsdb_tsnotification", "django_content_type", column: "r_type_id", name: "r_type_id_refs_id_d219ccc0"
  add_foreign_key "tsdb_tsnotification_intelligence", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_60977d4b"
  add_foreign_key "tsdb_tsnotification_intelligence", "tsdb_tsnotification", column: "tsnotification_id", name: "tsnotification_id_refs_id_7414e426"
  add_foreign_key "tsdb_tsportal_profile", "auth_user", column: "user_id", name: "user_id_refs_id_e5993632"
  add_foreign_key "tsdb_tsportal_profile", "tsdb_userorganization", column: "user_organization_id", name: "user_organization_id_refs_id_81d45449"
  add_foreign_key "tsdb_tsportal_profile_iprange", "tsdb_tsportal_profile", column: "tsportal_profile_id", name: "tsportal_profile_id_refs_id_8ef0333c"
  add_foreign_key "tsdb_tsportal_profile_iprange", "tsdb_useriprange", column: "useriprange_id", name: "useriprange_id_refs_id_dac21b00"
  add_foreign_key "tsdb_tsuseraction", "auth_user", column: "user_id", name: "user_id_refs_id_6c1b1dd3"
  add_foreign_key "tsdb_tsuseraction", "django_content_type", column: "r_type_id", name: "r_type_id_refs_id_daaf4b2d"
  add_foreign_key "tsdb_tsvendorkey", "trustedcircles_trustedcircle", column: "channel_id", name: "tsdb_tsvendorkey_channel_id_fkey"
  add_foreign_key "tsdb_tsvendorkey", "tsdb_userorganization", column: "owner_org_id", name: "tsdb_tsvendorkey_owner_org_id_fkey"
  add_foreign_key "tsdb_tsworkgroup", "tsdb_userorganization", column: "owner_org_id", name: "owner_org_id_refs_id_1edba28e"
  add_foreign_key "tsdb_tsworkgroupmember", "auth_user", column: "user_id", name: "user_id_refs_id_5540e3a6"
  add_foreign_key "tsdb_tsworkgroupmember", "tsdb_tsworkgroup", column: "workgroup_id", name: "workgroup_id_refs_id_c506b7ef"
  add_foreign_key "tsdb_ttp", "tsdb_userorganization", column: "organization_id", name: "organization_id_refs_id_8b405db4"
  add_foreign_key "tsdb_ttp_actors", "tsdb_actor", column: "actor_id", name: "actor_id_refs_id_24add506"
  add_foreign_key "tsdb_ttp_actors", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_fa561077"
  add_foreign_key "tsdb_ttp_children", "tsdb_ttp", column: "from_ttp_id", name: "from_ttp_id_refs_id_3fc39010"
  add_foreign_key "tsdb_ttp_children", "tsdb_ttp", column: "to_ttp_id", name: "to_ttp_id_refs_id_3fc39010"
  add_foreign_key "tsdb_ttp_circles", "trustedcircles_trustedcircle", column: "trustedcircle_id", name: "trustedcircle_id_refs_id_96f96add"
  add_foreign_key "tsdb_ttp_circles", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_2c0c4013"
  add_foreign_key "tsdb_ttp_downvotes", "auth_user", column: "user_id", name: "user_id_refs_id_470f01f0"
  add_foreign_key "tsdb_ttp_downvotes", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_a8cb5562"
  add_foreign_key "tsdb_ttp_intelligence", "intelligence", column: "intelligence2_id", name: "intelligence2_id_refs_id_9c933ef6"
  add_foreign_key "tsdb_ttp_intelligence", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_447ade08"
  add_foreign_key "tsdb_ttp_killchainstages", "tsdb_killchainstage", column: "killchainstage_id", name: "killchainstage_id_refs_id_d1231bfc"
  add_foreign_key "tsdb_ttp_killchainstages", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_54531a5a"
  add_foreign_key "tsdb_ttp_signatures", "tsdb_signature", column: "signature_id", name: "signature_id_refs_id_3a43b2fc"
  add_foreign_key "tsdb_ttp_signatures", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_40a31aad"
  add_foreign_key "tsdb_ttp_stars", "auth_user", column: "user_id", name: "user_id_refs_id_45b6dd74"
  add_foreign_key "tsdb_ttp_stars", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_683ae48f"
  add_foreign_key "tsdb_ttp_upvotes", "auth_user", column: "user_id", name: "user_id_refs_id_7542eebb"
  add_foreign_key "tsdb_ttp_upvotes", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_3ed6f957"
  add_foreign_key "tsdb_ttp_watching", "auth_user", column: "user_id", name: "user_id_refs_id_630099a9"
  add_foreign_key "tsdb_ttp_watching", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_b78b6385"
  add_foreign_key "tsdb_ttpalias", "tsdb_ttp", column: "ttp_id", name: "ttp_id_refs_id_6271383a"
  add_foreign_key "tsdb_userchangehistory", "auth_user", column: "changed_by_id", name: "changed_by_id_refs_id_bc896b09"
  add_foreign_key "tsdb_userchangehistory", "auth_user", column: "user_id", name: "user_id_refs_id_bc896b09"
  add_foreign_key "tsdb_userorganization", "tsdb_identityprovider", column: "identity_provider_id", name: "identity_provider_id_refs_id_b2926ae1"
  add_foreign_key "tsdb_userorganization", "tsdb_reseller", column: "reseller_id", name: "reseller_id_refs_id_4fa3bb60"
  add_foreign_key "tsdb_userorganization_admins", "auth_user", column: "user_id", name: "user_id_refs_id_a8b70395"
  add_foreign_key "tsdb_userorganization_admins", "tsdb_userorganization", column: "userorganization_id", name: "userorganization_id_refs_id_15965c67"
  add_foreign_key "tsdb_userorganization_groups", "auth_group", column: "group_id", name: "group_id_refs_id_dcc00547"
  add_foreign_key "tsdb_userorganization_groups", "tsdb_userorganization", column: "userorganization_id", name: "userorganization_id_refs_id_f74a122d"
  add_foreign_key "tsdb_userorganization_user_permissions", "auth_permission", column: "permission_id", name: "permission_id_refs_id_35906853"
  add_foreign_key "tsdb_userorganization_user_permissions", "tsdb_userorganization", column: "userorganization_id", name: "userorganization_id_refs_id_898e8b5c"
  add_foreign_key "tsdb_whitelist", "auth_user", column: "added_by_user_id_id", name: "added_by_user_id_id_refs_id_9e2ed0ff"
end
