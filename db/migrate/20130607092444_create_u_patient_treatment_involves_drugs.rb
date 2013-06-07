class CreateUPatientTreatmentInvolvesDrugs < ActiveRecord::Migration
  def change
    create_table :u_patient_treatment_involves_drugs do |t|
      t.datetime :date
      t.string :drug_code
      t.integer :u_patient_nr

      t.timestamps
    end
  end
end
