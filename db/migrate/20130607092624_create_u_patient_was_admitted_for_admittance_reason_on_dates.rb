class CreateUPatientWasAdmittedForAdmittanceReasonOnDates < ActiveRecord::Migration
  def change
    create_table :u_patient_was_admitted_for_admittance_reason_on_dates do |t|
      t.string :admittance_reason
      t.datetime :date
      t.integer :u_patient_nr

      t.timestamps
    end
  end
end
