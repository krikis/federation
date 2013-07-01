class CreateMPatientAdmittedForAdmissionReasonOnDates < ActiveRecord::Migration
  def change
    create_table :m_patient_admitted_for_admission_reason_on_dates do |t|
      t.string :admission_reason_code
      t.datetime :date
      t.integer :m_patient_nr

      t.timestamps
    end

    execute 'alter table m_patient_admitted_for_admission_reason_on_dates add unique index (m_patient_nr, date, admission_reason_code)'
    execute 'alter table m_patient_admitted_for_admission_reason_on_dates add foreign key (m_patient_nr) references m_patients(m_patient_nr)'
  end
end
