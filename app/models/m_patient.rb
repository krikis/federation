class MPatient < ActiveRecord::Base

  has_many :m_patient_is_allergic_to_drugs,
           foreign_key: 'm_patient_nr'
  has_many :m_patient_treatment_involves_drug,
           foreign_key: 'm_patient_nr'
  has_many :m_patient_admitted_for_admission_reason_on_dates
           foreign_key: 'm_patient_nr'

end
