require 'spec_helper'

describe UmcgTreatmentInvolvesDrug do

  it 'has an instance for every UPatientTreatmentInvolvesDrug' do
    u_patient_treatment_involves_drug = Fabricate :u_patient_treatment_involves_drug
    described_class.first.attributes.should eq("date" => u_patient_treatment_involves_drug.date,
                                               "drug_code" => u_patient_treatment_involves_drug.drug_code,
                                               "umcg_patient_nr" => u_patient_treatment_involves_drug.u_patient_nr)
  end

end