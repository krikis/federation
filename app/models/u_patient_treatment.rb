class UPatientTreatment < ActiveRecord::Base

  include HasDetails

  has_many :u_patient_treatment_involves_drugs,
     primary_key: 'u_patient_nr',
     foreign_key: 'u_patient_nr',
     conditions: Proc.new { {date: 'date'} },
     dependent: :destroy

end
