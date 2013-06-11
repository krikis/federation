class CreateMartiniPatients < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view martini_patients as
      select r.local_nr as martini_patient_nr,
             r.epd_patient_id as epd_patient_id
      from epd_patient_plays_role_using_local_nrs r
      where r.role = 'MZKH'
    SQL
  end

  def down
    execute 'drop view martini_patients'
  end
end
