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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130701134531) do

  create_table "common_objects", :id => false, :force => true do |t|
    t.integer  "epd_patient_id",              :null => false
    t.datetime "date"
    t.string   "gender"
    t.string   "name"
    t.integer  "home_phone_nr",  :limit => 8
  end

  create_table "epd_patient_plays_role_using_local_nrs", :force => true do |t|
    t.integer  "local_nr",       :null => false
    t.string   "role",           :null => false
    t.integer  "epd_patient_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "epd_patient_plays_role_using_local_nrs", ["role", "epd_patient_id"], :name => "role_2", :unique => true
  add_index "epd_patient_plays_role_using_local_nrs", ["role", "local_nr"], :name => "role", :unique => true

  create_table "epd_patient_was_mzkh_admitted_for_admit_reason_on_dates", :id => false, :force => true do |t|
    t.string   "admit_reason_code", :null => false
    t.datetime "date",              :null => false
    t.integer  "epd_patient_id",    :null => false
  end

  create_table "epd_patient_was_umcg_admitted_for_admit_reason_on_dates", :id => false, :force => true do |t|
    t.string   "admit_reason_code", :null => false
    t.datetime "date",              :null => false
    t.integer  "epd_patient_id",    :null => false
  end

  create_table "epd_patients", :id => false, :force => true do |t|
    t.integer  "epd_patient_id", :null => false
    t.datetime "date"
    t.string   "gender"
    t.string   "name"
    t.integer  "home_phone_nr"
  end

  create_table "m_patient_admitted_for_admission_reason_on_dates", :force => true do |t|
    t.string   "admission_reason_code", :null => false
    t.datetime "date",                  :null => false
    t.integer  "m_patient_nr",          :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "m_patient_admitted_for_admission_reason_on_dates", ["m_patient_nr", "date", "admission_reason_code"], :name => "m_patient_nr", :unique => true

  create_table "m_patient_is_allergic_to_drugs", :force => true do |t|
    t.string   "drug_code",    :null => false
    t.integer  "m_patient_nr", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "m_patient_is_allergic_to_drugs", ["m_patient_nr", "drug_code"], :name => "m_patient_nr", :unique => true

  create_table "m_patient_treatment_involves_drugs", :force => true do |t|
    t.datetime "date",          :null => false
    t.string   "drug_code",     :null => false
    t.integer  "m_patient_nr",  :null => false
    t.integer  "specialist_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "m_patient_treatment_involves_drugs", ["m_patient_nr", "drug_code", "date", "specialist_id"], :name => "m_patient_nr", :unique => true

  create_table "m_patients", :force => true do |t|
    t.integer  "m_patient_nr", :null => false
    t.datetime "date",         :null => false
    t.string   "gender",       :null => false
    t.string   "name",         :null => false
    t.integer  "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "m_patients", ["m_patient_nr"], :name => "m_patient_nr", :unique => true

  create_table "martini_patient_allergic_to_drugs", :id => false, :force => true do |t|
    t.string  "drug_code",          :null => false
    t.integer "martini_patient_nr", :null => false
  end

  create_table "martini_patients", :id => false, :force => true do |t|
    t.integer "martini_patient_nr", :null => false
    t.integer "epd_patient_id",     :null => false
  end

  create_table "martini_treatment_involves_drugs", :id => false, :force => true do |t|
    t.datetime "date",               :null => false
    t.string   "drug_code",          :null => false
    t.integer  "martini_patient_nr", :null => false
    t.integer  "martini_doctor_id",  :null => false
  end

  create_table "mzkh_diabetes_patients", :id => false, :force => true do |t|
    t.string "name"
  end

  create_table "u_patient_has_phones", :force => true do |t|
    t.integer  "phone",        :null => false
    t.integer  "u_patient_nr", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "u_patient_has_phones", ["u_patient_nr", "phone"], :name => "u_patient_nr", :unique => true

  create_table "u_patient_treatment_involves_drugs", :force => true do |t|
    t.datetime "date",         :null => false
    t.string   "drug_code",    :null => false
    t.integer  "u_patient_nr", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "u_patient_treatment_involves_drugs", ["u_patient_nr", "date"], :name => "u_patient_nr_2"
  add_index "u_patient_treatment_involves_drugs", ["u_patient_nr", "drug_code", "date"], :name => "u_patient_nr", :unique => true

  create_table "u_patient_treatments", :force => true do |t|
    t.datetime "date",         :null => false
    t.integer  "u_patient_nr", :null => false
    t.integer  "doctor_id",    :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "u_patient_treatments", ["u_patient_nr", "date"], :name => "u_patient_nr", :unique => true

  create_table "u_patient_was_admitted_for_admittance_reason_on_dates", :force => true do |t|
    t.string   "admittance_reason", :null => false
    t.datetime "date",              :null => false
    t.integer  "u_patient_nr",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "u_patient_was_admitted_for_admittance_reason_on_dates", ["u_patient_nr", "date", "admittance_reason"], :name => "u_patient_nr", :unique => true

  create_table "u_patients", :force => true do |t|
    t.integer  "u_patient_nr", :null => false
    t.datetime "date",         :null => false
    t.string   "gender",       :null => false
    t.string   "name",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "u_patients", ["u_patient_nr"], :name => "u_patient_nr", :unique => true

  create_table "umcg_patients", :id => false, :force => true do |t|
    t.integer "umcg_patient_nr", :null => false
    t.integer "epd_patient_id",  :null => false
    t.integer "mobile_phone_nr"
    t.integer "office_phone_nr"
  end

  create_table "umcg_prolife4_doctors", :id => false, :force => true do |t|
    t.integer "umcg_doctor_id", :null => false
  end

  create_table "umcg_treatment_involves_drugs", :id => false, :force => true do |t|
    t.datetime "date",            :null => false
    t.string   "drug_code",       :null => false
    t.integer  "umcg_patient_nr", :null => false
  end

  create_table "umcg_treatments", :id => false, :force => true do |t|
    t.datetime "date",            :null => false
    t.integer  "umcg_patient_nr", :null => false
    t.integer  "umcg_doctor_id",  :null => false
  end

end
