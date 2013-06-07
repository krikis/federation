class CreateUPatientHasPhones < ActiveRecord::Migration
  def change
    create_table :u_patient_has_phones do |t|
      t.integer :phone
      t.integer :u_patient_nr

      t.timestamps
    end
  end
end
