class CreateUPatientWasAdmittedForAdmittanceReasonOnDates < ActiveRecord::Migration
  def change
    create_table :u_patient_was_admitted_for_admittance_reason_on_dates do |t|
      t.string :admittance_reason, null: false
      t.datetime :date, null: false
      t.integer :u_patient_nr, null: false

      t.timestamps
    end

    execute 'alter table u_patient_was_admitted_for_admittance_reason_on_dates add unique index (u_patient_nr, date, admittance_reason)'
    execute 'alter table u_patient_was_admitted_for_admittance_reason_on_dates add foreign key (u_patient_nr) references u_patients(u_patient_nr) on update cascade'
  end
end
