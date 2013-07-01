class CreateUPatientWasAdmittedForAdmittanceReasonOnDates < ActiveRecord::Migration
  def change
    create_table :u_patient_was_admitted_for_admittance_reason_on_dates do |t|
      t.string :admittance_reason
      t.datetime :date
      t.integer :u_patient_nr

      t.timestamps
    end

    execute 'alter table u_patient_was_admitted_for_admittance_reason_on_dates drop primary key, add primary key (id, u_patient_nr, date, admittance_reason)'
    execute 'alter table u_patient_was_admitted_for_admittance_reason_on_dates add foreign key (u_patient_nr) references u_patients(u_patient_nr)'
  end
end
