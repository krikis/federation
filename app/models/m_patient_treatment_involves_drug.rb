class MPatientTreatmentInvolvesDrug < ActiveRecord::Base

  include HasDetails
  self.primary_key = :id

end
