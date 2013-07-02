class EpdPatient < ActiveRecord::Base

  include HasDetails

  has_one  :martini_patient,
           primary_key: 'epd_patient_id',
           dependent: :destroy
  has_many :epd_patient_was_mzkh_admitted_for_admit_reason_on_dates,
           primary_key: 'epd_patient_id',
           dependent: :destroy
  has_many :martini_patient_allergic_to_drugs, through: :martini_patient
  has_many :martini_treatment_involves_drugs, through: :martini_patient

  has_one  :umcg_patient,
           primary_key: 'epd_patient_id',
           dependent: :destroy
  has_many :epd_patient_was_umcg_admitted_for_admit_reason_on_dates,
           primary_key: 'epd_patient_id',
           dependent: :destroy
  has_many :umcg_treatments, through: :umcg_patient
  has_many :umcg_treatment_involves_drugs, through: :umcg_patient

end
