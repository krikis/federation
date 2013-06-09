class CreateEpdPatients < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view epd_patients as
      select r.epd_patient_id as epd_patient_id
      from (epd_patient_plays_role_using_local_nrs r
            left join m_patients m on r.role = 'MZKH' and r.local_nr = m.m_patient_nr)
            left join
              (u_patients u left join u_patient_has_phones p on p.u_patient_nr = u.u_patient_nr)
            on r.role = 'UMCG' and r.local_nr = u.u_patient_nr
    SQL
  end

  def down
    execute <<-SQL
      drop view epd_patients
    SQL
  end
end
