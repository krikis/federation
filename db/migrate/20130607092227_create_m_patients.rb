class CreateMPatients < ActiveRecord::Migration
  def change
    create_table :m_patients do |t|
      t.integer :m_patient_nr, null: false
      t.datetime :date, null: false
      t.string :gender, null: false
      t.string :name, null: false
      t.integer :phone_number

      t.timestamps
    end

    execute 'alter table m_patients add unique index (m_patient_nr)'
  end
end
