class CreateEpdPatientPlaysRoleUsingLocalNrs < ActiveRecord::Migration
  def change
    create_table :epd_patient_plays_role_using_local_nrs do |t|
      t.integer :local_nr
      t.string :role
      t.integer :epd_patient_id

      t.timestamps
    end
  end
end
