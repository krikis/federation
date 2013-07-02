class CreateUPatientTreatmentInvolvesDrugs < ActiveRecord::Migration
  def change
    create_table :u_patient_treatment_involves_drugs do |t|
      t.datetime :date, null: false
      t.string :drug_code, null: false
      t.integer :u_patient_nr, null: false

      t.timestamps
    end

    execute <<-SQL
      create trigger default_u_patient_treatment_involves_drugs_date_to_today before insert on u_patient_treatment_involves_drugs
        for each row begin
          if new.date is null then
            set new.date = curdate();
          end if;
        end;
    SQL

    execute 'alter table u_patient_treatment_involves_drugs add unique index (u_patient_nr, drug_code, date)'
    execute 'alter table u_patient_treatment_involves_drugs add foreign key (u_patient_nr, date) references u_patient_treatments(u_patient_nr, date) on update cascade'
  end
end
