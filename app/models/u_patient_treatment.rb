class UPatientTreatment < ActiveRecord::Base

  include HasDetails
  self.primary_key = :id

  has_many :u_patient_treatment_involves_drugs,
           primary_key: 'u_patient_nr',
           foreign_key: 'u_patient_nr',
           dependent: :destroy

end
