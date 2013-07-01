class CreateUPatientTreatmentInvolvesDrugs < ActiveRecord::Migration
  def change
    create_table :u_patient_treatment_involves_drugs do |t|
      t.datetime :date
      t.string :drug_code
      t.integer :u_patient_nr

      t.timestamps
    end

    execute 'alter table u_patient_treatment_involves_drugs add unique index (u_patient_nr, drug_code, date)'
    execute 'alter table u_patient_treatment_involves_drugs add foreign key (u_patient_nr, date) references u_patient_treatments(u_patient_nr, date)'
  end
end
