class UmcgPatient < ActiveRecord::Base

  include HasDetails

  has_many :umcg_treatments,
           primary_key: 'umcg_patient_nr',
           foreign_key: 'umcg_patient_nr'
  has_many :umcg_treatment_involves_drugs,
           primary_key: 'umcg_patient_nr',
           foreign_key: 'umcg_patient_nr'

end
