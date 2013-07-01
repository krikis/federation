require 'spec_helper'

describe MartiniPatientAllergicToDrug do

  it 'has an instance for every MPatientIsAllergicToDrug' do
    m_patient_nr = 12345
    Fabricate :m_patient, m_patient_nr: m_patient_nr
    m_patient_is_allergic_to_drug = Fabricate :m_patient_is_allergic_to_drug,
                                              drug_code: 'some_drug',
                                              m_patient_nr: m_patient_nr
    described_class.first.attributes.should eq("drug_code" => m_patient_is_allergic_to_drug.drug_code,
                                               "martini_patient_nr" => m_patient_is_allergic_to_drug.m_patient_nr)
  end

end