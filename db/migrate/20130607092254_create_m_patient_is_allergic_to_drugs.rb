class CreateMPatientIsAllergicToDrugs < ActiveRecord::Migration
  def change
    create_table :m_patient_is_allergic_to_drugs do |t|
      t.string :drug_code
      t.integer :m_patient_nr

      t.timestamps
    end

    execute 'alter table m_patient_is_allergic_to_drugs add unique index (m_patient_nr, drug_code)'
    execute 'alter table m_patient_is_allergic_to_drugs add foreign key (m_patient_nr) references m_patients(m_patient_nr) on update cascade'
  end
end
