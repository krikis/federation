class CreateEpdPatients < ActiveRecord::Migration
  def up
    # create the epd_patients view
    execute <<-SQL
      create view epd_patients as
      select r.epd_patient_id,
             min(coalesce(m.date, u.date)) as date,
             min(coalesce(case m.gender when 'M' then 'Male' when 'F' then 'Female' end, u.gender)) as gender,
             min(coalesce(m.name, u.name)) as name,
             min(coalesce(m.phone_number, p.phone)) as home_phone_nr
      from epd_patient_plays_role_using_local_nrs r
      left join m_patients m on r.role = 'MZKH' and r.local_nr = m.m_patient_nr
      left join u_patients u on r.role = 'UMCG' and r.local_nr = u.u_patient_nr
      left join u_patient_has_phones p on p.u_patient_nr = u.u_patient_nr
      group by r.epd_patient_id
    SQL
  end

  def down
    execute 'drop view epd_patients'
  end
end
