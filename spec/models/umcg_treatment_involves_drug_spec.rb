require 'spec_helper'

describe UmcgTreatmentInvolvesDrug do

  it 'has an instance for every UPatientTreatmentInvolvesDrug' do
    u_patient_nr, date = 12345, Date.today
    u_patient = Fabricate :u_patient, u_patient_nr: u_patient_nr
    u_patient_treatment = Fabricate :u_patient_treatment, u_patient_nr: u_patient_nr, date: date
    u_patient_treatment_involves_drug = Fabricate :u_patient_treatment_involves_drug,
                                                  date: date,
                                                  drug_code: 'some_drug',
                                                  u_patient_nr: u_patient_nr
    described_class.first.attributes.should eq("date" => u_patient_treatment_involves_drug.date,
                                               "drug_code" => u_patient_treatment_involves_drug.drug_code,
                                               "umcg_patient_nr" => u_patient_treatment_involves_drug.u_patient_nr)
  end

end