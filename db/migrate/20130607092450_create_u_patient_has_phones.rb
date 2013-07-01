class CreateUPatientHasPhones < ActiveRecord::Migration
  def change
    create_table :u_patient_has_phones do |t|
      t.integer :phone
      t.integer :u_patient_nr

      t.timestamps
    end

    execute 'alter table u_patient_has_phones drop primary key, add primary key (id, u_patient_nr, phone)'
    execute 'alter table u_patient_has_phones add foreign key (u_patient_nr) references u_patients(u_patient_nr)'
  end
end
