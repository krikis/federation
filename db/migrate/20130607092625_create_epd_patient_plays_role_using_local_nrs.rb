class CreateEpdPatientPlaysRoleUsingLocalNrs < ActiveRecord::Migration
  def change
    create_table :epd_patient_plays_role_using_local_nrs do |t|
      t.integer :local_nr
      t.string :role
      t.integer :epd_patient_id

      t.timestamps
    end

    execute 'alter table epd_patient_plays_role_using_local_nrs add unique index (role, local_nr)'
    execute 'alter table epd_patient_plays_role_using_local_nrs add unique index (role, epd_patient_id)'
  end
end
