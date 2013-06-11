class CreateUmcgPatients < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view umcg_patients as
      select r.local_nr as umcg_patient_nr,
             r.epd_patient_id as epd_patient_id,
             mp2.phone as mobile_phone_nr,
             op2.phone as office_phone_nr
      from epd_patient_plays_role_using_local_nrs r
      left join u_patient_has_phones mp on r.local_nr = mp.u_patient_nr
      left join u_patient_has_phones mp2 on r.local_nr = mp2.u_patient_nr and mp.id < mp2.id
      left join u_patient_has_phones op on r.local_nr = op.u_patient_nr
      left join u_patient_has_phones op2 on r.local_nr = op2.u_patient_nr and op.id < op2.id
      left join u_patient_has_phones op3 on r.local_nr = op3.u_patient_nr and op2.id < op3.id
      where r.role = 'UMCG' and (mp.id is not null or mp2.id is null) and op3.id is null
    SQL
  end

  def down
    execute 'drop view umcg_patients'
  end
end
