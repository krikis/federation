require 'spec_helper'

describe UmcgProlife4Doctor do

  it 'contains an instance for every umcg_doctor that treated a umcg_patient
      which was also treated in the martini using the drug ProLife4' do
    umcg_doctor_id = 10
    epd_patient_id = 110
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.today, u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, m_patient_nr: mzkh_local_nr
    m_treatment = Fabricate :m_patient_treatment_involves_drug, date: Date.today, drug_code: 'ProLife4',
                            m_patient_nr: mzkh_local_nr, specialist_id: 12345
    UmcgProlife4Doctor.first.attributes.should eq('umcg_doctor_id' => umcg_doctor_id)
  end

  it 'does not contain instances for umcg_doctors that treated a umcg_patient
      which was also treated in the martini using a different drug' do
    umcg_doctor_id = 10
    epd_patient_id = 110
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.today, u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, m_patient_nr: mzkh_local_nr
    m_treatment = Fabricate :m_patient_treatment_involves_drug, date: Date.today, drug_code: 'other_drug',
                            m_patient_nr: mzkh_local_nr, specialist_id: 12345
    UmcgProlife4Doctor.count.should be_zero
  end

  it 'does not contain instances for umcg_doctors that treated umcg_patients other
      than patients which were treated in the martini using the drug ProLife4' do
    umcg_doctor_id = 10
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: 111
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.today, u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: 110
    m_patient = Fabricate :m_patient, m_patient_nr: mzkh_local_nr
    m_treatment = Fabricate :m_patient_treatment_involves_drug, date: Date.today, drug_code: 'ProLife4',
                            m_patient_nr: mzkh_local_nr, specialist_id: 12345
    UmcgProlife4Doctor.count.should be_zero
  end

end
