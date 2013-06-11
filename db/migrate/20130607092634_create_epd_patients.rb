class CreateEpdPatients < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view epd_patients as
      select r.epd_patient_id,
             case m.date when null then u.date else m.date end as date,
             case m.gender when 'F' then 'Female' when 'M' then 'Male' when null then m.gender else u.gender end as gender,
             case m.name when null then u.name else m.name end as name,
             case m.phone_number when null then p.phone else m.phone_number end as home_phone

      create view epd_patients as
      select r.epd_patient_id, m.date,
             case m.gender
             when 'F' then 'Female'
             when 'M' then 'Male'
             else m.gender end as gender,
             m.name, m.phone_number
      from epd_patient_plays_role_using_local_nrs r
      inner join m_patients m on r.role = 'MZKH' and r.local_nr = m.m_patient_nr
      union all
      select r.epd_patient_id, u.date, u.gender, u.name, p.phone
      from epd_patient_plays_role_using_local_nrs r
      inner join u_patients u on r.role = 'UMCG' and r.local_nr = u.u_patient_nr
      left join u_patient_has_phones p on p.u_patient_nr = u.u_patient_nr
    SQL
  end

  def down
    execute <<-SQL
      drop view epd_patients
    SQL
  end
end
