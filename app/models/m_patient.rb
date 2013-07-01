class MPatient < ActiveRecord::Base

  include HasDetails
  self.primary_key = :id

  has_many :m_patient_is_allergic_to_drugs,
           primary_key: 'm_patient_nr',
           foreign_key: 'm_patient_nr',
           dependent: :destroy
  has_many :m_patient_treatment_involves_drugs,
           primary_key: 'm_patient_nr',
           foreign_key: 'm_patient_nr',
           dependent: :destroy
  has_many :m_patient_admitted_for_admission_reason_on_dates,
           primary_key: 'm_patient_nr',
           foreign_key: 'm_patient_nr',
           dependent: :destroy

end
