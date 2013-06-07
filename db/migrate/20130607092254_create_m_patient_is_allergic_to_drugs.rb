class CreateMPatientIsAllergicToDrugs < ActiveRecord::Migration
  def change
    create_table :m_patient_is_allergic_to_drugs do |t|
      t.string :drug_code
      t.integer :m_patient_nr

      t.timestamps
    end
  end
end
