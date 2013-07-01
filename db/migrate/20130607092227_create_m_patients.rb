class CreateMPatients < ActiveRecord::Migration
  def change
    create_table :m_patients do |t|
      t.integer :m_patient_nr
      t.datetime :date
      t.string :gender
      t.string :name
      t.integer :phone_number

      t.timestamps
    end

    execute 'alter table m_patients drop primary key, add primary key (id, m_patient_nr), add index (m_patient_nr)'
  end
end
