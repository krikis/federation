class MartiniPatient < ActiveRecord::Base

  include HasDetails
  self.primary_key = :id

  has_many :martini_patient_allergic_to_drugs,
           primary_key: 'martini_patient_nr',
           foreign_key: 'martini_patient_nr',
           dependent: :destroy
  has_many :martini_treatment_involves_drugs,
           primary_key: 'martini_patient_nr',
           foreign_key: 'martini_patient_nr',
           dependent: :destroy

end
