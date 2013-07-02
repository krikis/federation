class CreateUmcgPatients < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view umcg_patients as
      select r.local_nr as umcg_patient_nr,
             r.epd_patient_id as epd_patient_id,
             BigToInt(if((select count(*) from u_patient_has_phones p3 where r.local_nr = p3.u_patient_nr and p3.id < p.id)  = 1, p.phone, null)) as mobile_phone_nr,
             BigToInt(if((select count(*) from u_patient_has_phones p4 where r.local_nr = p4.u_patient_nr and p4.id < p2.id) = 2, p2.phone, null)) as office_phone_nr
      from epd_patient_plays_role_using_local_nrs r
      left join u_patient_has_phones p  on r.local_nr = p.u_patient_nr
      left join u_patient_has_phones p2 on r.local_nr = p2.u_patient_nr
      where r.role = 'UMCG' and
            ((select count(*) from u_patient_has_phones p3 where r.local_nr = p3.u_patient_nr) < 2 or
             ((select count(*) from u_patient_has_phones p3 where r.local_nr = p3.u_patient_nr) = 2 and
              (select count(*) from u_patient_has_phones p3 where r.local_nr = p3.u_patient_nr and p3.id < p.id)  = 1) or
             ((select count(*) from u_patient_has_phones p3 where r.local_nr = p3.u_patient_nr and p3.id < p.id)  = 1 and
              (select count(*) from u_patient_has_phones p4 where r.local_nr = p4.u_patient_nr and p4.id < p2.id) = 2))
    SQL
  end

  def down
    execute 'drop view umcg_patients'
  end
end
