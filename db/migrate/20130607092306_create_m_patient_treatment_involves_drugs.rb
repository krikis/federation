class CreateMPatientTreatmentInvolvesDrugs < ActiveRecord::Migration
  def change
    create_table :m_patient_treatment_involves_drugs do |t|
      t.date_time :date
      t.string :drug_code
      t.integer :m_patient_nr
      t.integer :specialist_id

      t.timestamps
    end
  end
end
