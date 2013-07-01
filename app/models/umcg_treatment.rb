class UmcgTreatment < ActiveRecord::Base

  include HasDetails
  self.primary_key = :id

  has_many :umcg_treatment_involves_drugs,
           primary_key: 'umcg_patient_nr',
           foreign_key: 'umcg_patient_nr',
           dependent: :destroy

end
