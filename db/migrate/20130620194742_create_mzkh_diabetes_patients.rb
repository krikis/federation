class CreateMzkhDiabetesPatients < ActiveRecord::Migration
  def up
    execute <<-SQL
      /* Give the names of all patients that were admitted in the MZKH-hospital    */
      /* in 2013 for 'Diabetes' and were also treated in 2013 in the UMCG-hospital */
      /* for 'Liver disease' by the doctor with local id-value 218480              */
      create view mzkh_diabetes_patients as
      select p.name
      from common_objects as p, umcg_patients as u, umcg_treatments as mt,
           epd_patient_was_umcg_admitted_for_admit_reason_on_dates as ua,
           epd_patient_was_mzkh_admitted_for_admit_reason_on_dates as ma
      where ma.epd_patient_id = p.epd_patient_id and ma.date >= '2013-01-01 00:00:00' and
            ma.date < '2014-01-01 00:00:00' and ma.admit_reason_code = 'Diabetes' and
            ua.epd_patient_id = p.epd_patient_id and ua.date >= '2013-01-01 00:00:00' and
            ua.date < '2014-01-01 00:00:00' and ua.admit_reason_code = 'Liver disease' and
            u.epd_patient_id = p.epd_patient_id and mt.umcg_patient_nr = u.umcg_patient_nr and
            mt.umcg_doctor_id = 218480 and mt.date >= '2013-01-01 00:00:00' and
            mt.date < '2014-01-01 00:00:00'
    SQL
  end

  def down
    execute 'drop view mzkh_diabetes_patients'
  end
end
