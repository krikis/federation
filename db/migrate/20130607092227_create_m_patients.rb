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
  end
end
