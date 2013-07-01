class CreateMPatientIsAllergicToDrugs < ActiveRecord::Migration
  def change
    create_table :m_patient_is_allergic_to_drugs do |t|
      t.string :drug_code
      t.integer :m_patient_nr

      t.timestamps
    end

    execute 'alter table m_patient_is_allergic_to_drugs drop primary key, add primary key (id, m_patient_nr, drug_code)'
    execute 'alter table m_patient_is_allergic_to_drugs add foreign key (m_patient_nr) references m_patients(m_patient_nr)'
  end
end
