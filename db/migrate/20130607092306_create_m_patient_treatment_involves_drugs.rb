class CreateMPatientTreatmentInvolvesDrugs < ActiveRecord::Migration
  def change
    create_table :m_patient_treatment_involves_drugs do |t|
      t.datetime :date, null: false
      t.string :drug_code, null: false
      t.integer :m_patient_nr, null: false
      t.integer :specialist_id, null: false

      t.timestamps
    end

    execute 'alter table m_patient_treatment_involves_drugs add unique index (m_patient_nr, drug_code, date, specialist_id)'
    execute 'alter table m_patient_treatment_involves_drugs add foreign key (m_patient_nr) references m_patients(m_patient_nr) on update cascade'
  end
end
