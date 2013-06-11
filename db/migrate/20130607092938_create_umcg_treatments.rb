class CreateUmcgTreatments < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view umcg_treatments as
      select u.date as date,
             u.u_patient_nr as umcg_patient_nr,
             u.doctor_id as umcg_doctor_id
      from u_patient_treatments u
    SQL
  end

  def down
    execute 'drop view umcg_treatments'
  end
end
