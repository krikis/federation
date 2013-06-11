class CreateEpdPatientWasUmcgAdmittedForAdmitReasonOnDates < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view epd_patient_was_umcg_admitted_for_admit_reason_on_dates as
      select u.admittance_reason as admit_reason_code,
             u.date as date,
             r.epd_patient_id as epd_patient_id
      from epd_patient_plays_role_using_local_nrs r
      join u_patient_was_admitted_for_admittance_reason_on_dates u
      on r.role = 'UMCG' and r.local_nr = u.u_patient_nr
    SQL
  end

  def down
    execute 'drop view epd_patient_was_umcg_admitted_for_admit_reason_on_dates'
  end
end
