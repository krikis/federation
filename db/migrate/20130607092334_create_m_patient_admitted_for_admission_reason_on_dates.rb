class CreateMPatientAdmittedForAdmissionReasonOnDates < ActiveRecord::Migration
  def change
    create_table :m_patient_admitted_for_admission_reason_on_dates do |t|
      t.string :admission_reason_code
      t.datetime :date
      t.integer :m_patient_nr

      t.timestamps
    end
  end
end
