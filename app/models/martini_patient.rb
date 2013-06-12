class MartiniPatient < ActiveRecord::Base

  has_many :martini_patient_allergic_to_drugs,
           foreign_key: 'martini_patient_nr'
  has_many :martini_treatment_involves_drugs,
           foreign_key: 'martini_patient_nr'

end
