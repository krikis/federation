require 'spec_helper'

describe MartiniTreatmentInvolvesDrug do

  it 'has an instance for every MPatientTreatmentInvolvesDrug' do
    m_patient_nr = 12345678
    Fabricate :m_patient, m_patient_nr: m_patient_nr
    m_patient_treatment_involves_drug = Fabricate :m_patient_treatment_involves_drug,
                                                  date: Date.today,
                                                  drug_code: 'some_drug',
                                                  m_patient_nr: m_patient_nr,
                                                  specialist_id: 12345
    described_class.first.attributes.should eq("date" => m_patient_treatment_involves_drug.date,
                                               "drug_code" => m_patient_treatment_involves_drug.drug_code,
                                               "martini_patient_nr" => m_patient_treatment_involves_drug.m_patient_nr,
                                               "martini_doctor_id" => m_patient_treatment_involves_drug.specialist_id)
  end

end