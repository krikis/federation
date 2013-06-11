class CreateMartiniPatientAllergicToDrugs < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view martini_patient_allergic_to_drugs as
      select m.drug_code as drug_code,
             m.m_patient_nr as martini_patient_nr
      from m_patient_is_allergic_to_drugs m
    SQL
  end

  def down
    execute 'drop view martini_patient_allergic_to_drugs'
  end
end
