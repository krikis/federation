class CreateUPatientTreatments < ActiveRecord::Migration
  def change
    create_table :u_patient_treatments do |t|
      t.datetime :date
      t.integer :u_patient_nr
      t.integer :doctor_id

      t.timestamps
    end
  end
end
