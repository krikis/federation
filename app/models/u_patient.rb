class UPatient < ActiveRecord::Base

  has_many :u_patient_has_phones,
           foreign_key: 'u_patient_nr'
  has_many :u_patient_treatments,
           foreign_key: 'u_patient_nr'
  has_many :u_patient_treatemt_involves_drugs,
           foreign_key: 'u_patient_nr'
  has_many :u_patient_was_admitted_for_admittance_reason_on_dates,
           foreign_key: 'u_patient_nr'

end
