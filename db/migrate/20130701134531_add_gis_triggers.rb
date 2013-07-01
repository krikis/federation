class AddGisTriggers < ActiveRecord::Migration
  def up
    execute <<-SQL
      create trigger instantiate_mzkh_gis after insert on m_patients
        for each row begin
          set @next_epd_id = (select coalesce(max(epd_patient_id), 0) + 1 from epd_patient_plays_role_using_local_nrs);
          insert into epd_patient_plays_role_using_local_nrs set role = 'MZKH', local_nr = new.m_patient_nr, epd_patient_id = @next_epd_id;
        end;
    SQL
    execute <<-SQL
      create trigger update_mzkh_gis after update on m_patients
        for each row begin
          update epd_patient_plays_role_using_local_nrs set local_nr = new.m_patient_nr
          where local_nr = old.m_patient_nr and role = 'MZKH';
        end;
    SQL
    execute <<-SQL
      create trigger delete_mzkh_gis after delete on m_patients
        for each row begin
          delete from epd_patient_plays_role_using_local_nrs
          where local_nr = old.m_patient_nr and role = 'MZKH';
        end;
    SQL

    execute <<-SQL
      create trigger instantiate_umcg_gis after insert on u_patients
        for each row begin
          set @next_epd_id = (select coalesce(max(epd_patient_id), 0) + 1 from epd_patient_plays_role_using_local_nrs);
          insert into epd_patient_plays_role_using_local_nrs set role = 'UMCG', local_nr = new.u_patient_nr, epd_patient_id = @next_epd_id;
        end;
    SQL
    execute <<-SQL
      create trigger update_umcg_gis after update on u_patients
        for each row begin
          update epd_patient_plays_role_using_local_nrs set local_nr = new.u_patient_nr
          where local_nr = old.u_patient_nr and role = 'UMCG';
        end;
    SQL
    execute <<-SQL
      create trigger delete_umcg_gis after delete on u_patients
        for each row begin
          delete from epd_patient_plays_role_using_local_nrs
          where local_nr = old.u_patient_nr and role = 'UMCG';
        end;
    SQL
  end

  def down
    execute 'drop trigger instantiate_mzkh_gis'
    execute 'drop trigger update_mzkh_gis'
    execute 'drop trigger delete_mzkh_gis'
    execute 'drop trigger instantiate_umcg_gis'
    execute 'drop trigger update_umcg_gis'
    execute 'drop trigger delete_umcg_gis'
  end
end
