class CreateUmcgTreatmentInvolvesDrugs < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view umcg_treatment_involves_drugs as
      select u.date as date,
             u.drug_code as drug_code,
             u.u_patient_nr as umcg_patient_nr
      from u_patient_treatment_involves_drugs u
    SQL
  end

  def down
    execute 'drop view umcg_treatment_involves_drugs'
  end
end
