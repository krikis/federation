require 'spec_helper'

describe UmcgTreatment do

  it 'has an instance for each UPatientTreatment' do
    u_patient_treatment = Fabricate :u_patient_treatment, date: Date.today, u_patient_nr: 112, doctor_id: 10
    UmcgTreatment.first.attributes.should eq("date" => u_patient_treatment.date,
                                             "umcg_patient_nr" => u_patient_treatment.u_patient_nr,
                                             "umcg_doctor_id" => u_patient_treatment.doctor_id)
  end

end