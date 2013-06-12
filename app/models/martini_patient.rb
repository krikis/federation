class MartiniPatient < ActiveRecord::Base

  include HasDetails

  has_many :martini_patient_allergic_to_drugs,
           primary_key: 'martini_patient_nr',
           foreign_key: 'martini_patient_nr'
  has_many :martini_treatment_involves_drugs,
           primary_key: 'martini_patient_nr',
           foreign_key: 'martini_patient_nr'

end
