class EpdPatient < ActiveRecord::Base

  has_one  :martini_patient
  has_many :martini_patient_allergic_to_drugs, through: :martini_patient
  has_many :martini_treatment_involves_drugs, throug: :martini_patient
  has_many :epd_patient_was_mzkh_admitted_for_admit_reason_on_dates

  has_one  :umcg_patient
  has_many :umcg_treatments, through: :umcg_patient
  has_many :umcg_treatment_involves_drugs, through: :umcg_patient
  has_many :epd_patient_was_umcg_admitted_for_admit_reason_on_dates

end
