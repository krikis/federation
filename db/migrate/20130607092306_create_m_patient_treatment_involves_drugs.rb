class CreateMPatientTreatmentInvolvesDrugs < ActiveRecord::Migration
  def change
    create_table :m_patient_treatment_involves_drugs do |t|
      t.datetime :date
      t.string :drug_code
      t.integer :m_patient_nr
      t.integer :specialist_id

      t.timestamps
    end

    execute 'alter table m_patient_treatment_involves_drugs drop primary key, add primary key (id, m_patient_nr, drug_code, date, specialist_id)'
    execute 'alter table m_patient_treatment_involves_drugs add foreign key (m_patient_nr) references m_patients(m_patient_nr)'
  end
end
