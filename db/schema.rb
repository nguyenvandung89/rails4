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

ActiveRecord::Schema.define(version: 20140206104954) do

  create_table "cars", force: true do |t|
    t.integer  "m_manufacturer_id"
    t.integer  "m_life_car_id"
    t.integer  "gearbox_id"
    t.integer  "exterior_id"
    t.integer  "interior_id"
    t.integer  "instruction_boot_id"
    t.integer  "currency_id"
    t.integer  "m_status_id"
    t.integer  "m_origin_id"
    t.integer  "driven_id"
    t.string   "rank"
    t.string   "start_year"
    t.string   "km_use"
    t.integer  "amount"
    t.string   "number_door"
    t.string   "number_seat"
    t.string   "fuel"
    t.string   "system_fuel"
    t.integer  "consumption_fuel"
    t.string   "description"
    t.boolean  "airbags_for_driver"
    t.boolean  "airbags_for_fron_passengers"
    t.boolean  "airbags_for_rear_passengers"
    t.boolean  "two_row_side_airbags"
    t.boolean  "airbag_suspension_two_seats_and_after"
    t.boolean  "antilock_brakes"
    t.boolean  "electronic_brake_distribution"
    t.boolean  "emergency_brake_assist"
    t.boolean  "automatic_electronic_balance"
    t.boolean  "cruise_control"
    t.boolean  "back_support_alerts"
    t.boolean  "traction_control_system"
    t.boolean  "safety_latches"
    t.boolean  "automatic_door_lock"
    t.boolean  "power_door_lock_remote_control"
    t.boolean  "engine_immobilizer"
    t.boolean  "burglar_alarm_system_peripheral"
    t.boolean  "fog_lights"
    t.boolean  "warning_lights_seatbelt"
    t.boolean  "brake_3rd_light_mounted_high_side"
    t.boolean  "positioning_equipment"
    t.boolean  "roof_window"
    t.boolean  "glass_electric_adjustment"
    t.boolean  "power_steering"
    t.string   "seat_material"
    t.boolean  "air_conditioner_ago"
    t.boolean  "after_conditioning"
    t.boolean  "supports_auto"
    t.boolean  "tumble_glass_after"
    t.boolean  "fan_behind_glass"
    t.boolean  "stained_glass"
    t.boolean  "lcd_screen"
    t.string   "device_audio_video"
    t.string   "device_other"
    t.string   "width_wide_height"
    t.string   "wheelbase"
    t.string   "tread_front_rear"
    t.string   "weight"
    t.string   "fuel_tank_capacity"
    t.string   "engine"
    t.string   "engine_type"
    t.string   "cylinder_capacity"
    t.string   "brake"
    t.string   "reducing_care"
    t.string   "tires"
    t.string   "rim_wheels"
    t.string   "other_specifications"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visibility"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "title"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.string   "name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "driven_m_manufacturers", force: true do |t|
    t.integer "m_manufacturer_id"
    t.integer "driven_id"
  end

  create_table "drivens", force: true do |t|
    t.string   "driven_type"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "exteriors", force: true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gearboxes", force: true do |t|
    t.string   "gearbox_type"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruction_boots", force: true do |t|
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interiors", force: true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_amounts", force: true do |t|
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_life_cars", force: true do |t|
    t.integer  "m_manufacturer_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_manufacturers", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "name_en"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_origins", force: true do |t|
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_prefectures", force: true do |t|
    t.string   "name"
    t.string   "roman_name"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_buy_cars", force: true do |t|
    t.integer  "m_amount_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salon_cars", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "description"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "background"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
