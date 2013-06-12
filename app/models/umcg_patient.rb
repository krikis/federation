class UmcgPatient < ActiveRecord::Base

  has_many :umcg_treatments,
           foreign_key: 'umcg_patient_nr'
  has_many :umcg_treatment_involves_drugs,
           foreign_key: 'umcg_patient_nr'

end
