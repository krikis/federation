class UPatient < ActiveRecord::Base

  include HasDetails

  has_many :u_patient_has_phones,
           primary_key: 'u_patient_nr',
           foreign_key: 'u_patient_nr',
           dependent: :destroy
  has_many :u_patient_treatments,
           primary_key: 'u_patient_nr',
           foreign_key: 'u_patient_nr',
           dependent: :destroy
  has_many :u_patient_treatment_involves_drugs, through: :u_patient_treatments
  has_many :u_patient_was_admitted_for_admittance_reason_on_dates,
           primary_key: 'u_patient_nr',
           foreign_key: 'u_patient_nr',
           dependent: :destroy

end
