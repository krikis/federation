class CreateMartiniTreatmentInvolvesDrugs < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view martini_treatment_involves_drugs as
      select m.date as date,
             m.drug_code as drug_code,
             m.m_patient_nr as martini_patient_nr,
             m.specialist_id as martini_doctor_id
      from m_patient_treatment_involves_drugs m
    SQL
  end

  def down
    execute 'drop view martini_treatment_involves_drugs'
  end
end
