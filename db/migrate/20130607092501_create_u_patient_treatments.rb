class CreateUPatientTreatments < ActiveRecord::Migration
  def change
    create_table :u_patient_treatments do |t|
      t.datetime :date
      t.integer :u_patient_nr
      t.integer :doctor_id

      t.timestamps
    end

    execute <<-SQL
      create trigger default_u_patient_treatment_date_to_today before insert on u_patient_treatments
        for each row begin
          if new.date is null then
            set new.date = curdate();
          end if;
        end;
    SQL

    execute 'alter table u_patient_treatments add unique index (u_patient_nr, date)'
    execute 'alter table u_patient_treatments add foreign key (u_patient_nr) references u_patients(u_patient_nr) on update cascade'
  end
end
