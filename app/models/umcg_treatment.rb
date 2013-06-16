class UmcgTreatment < ActiveRecord::Base

  include HasDetails

  has_many :umcg_treatment_involves_drugs,
           primary_key: 'umcg_patient_nr',
           foreign_key: 'umcg_patient_nr',
           conditions: 'umcg_treatment_involves_drugs.date = umcg_treatments.date',
           dependent: :destroy

end
