class CreateEpdPatientWasMzkhAdmittedForAdmitReasonOnDates < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view epd_patient_was_mzkh_admitted_for_admit_reason_on_dates as
      select m.admission_reason_code as admit_reason_code,
             m.date as date,
             r.epd_patient_id as epd_patient_id
      from epd_patient_plays_role_using_local_nrs r
      join m_patient_admitted_for_admission_reason_on_dates m
      on r.role = 'MZKH' and r.local_nr = m.m_patient_nr
    SQL
  end

  def down
    execute 'drop view epd_patient_was_mzkh_admitted_for_admit_reason_on_dates'
  end
end
