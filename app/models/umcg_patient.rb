class UmcgPatient < ActiveRecord::Base

  include HasDetails
  self.primary_key = :id

  has_many :umcg_treatments,
           primary_key: 'umcg_patient_nr',
           foreign_key: 'umcg_patient_nr',
           dependent: :destroy
  has_many :umcg_treatment_involves_drugs, through: :umcg_treatments

end
