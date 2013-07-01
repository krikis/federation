require 'spec_helper'

describe MzkhDiabetesPatient do

  it 'contains an instance for every mzkh_patient admitted for Diabetes in 2013
      which in 2013 was also treated for Liver disease in the umcg by doctor 218480' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 218480
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2013, 5, 23), admission_reason_code: 'Diabetes',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2013, 7, 12), admittance_reason: 'Liver disease',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2013, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.first.name.should eq(mzkh_patient_name)
  end

  it 'does not contain instances for mzkh_patients admitted for other reasons in 2013' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 218480
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2013, 5, 23), admission_reason_code: 'other_reason',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2013, 7, 12), admittance_reason: 'Liver disease',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2013, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.count.should be_zero
  end

  it 'does not contain instances for mzkh_patients treated for other reasons in the umcg' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 218480
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2013, 5, 23), admission_reason_code: 'Diabetes',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2013, 7, 12), admittance_reason: 'other_reason',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2013, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.count.should be_zero
  end

  it 'does not contain instances for mzkh_patients admitted for Diabetes in another year' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 218480
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2012, 5, 23), admission_reason_code: 'Diabetes',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2013, 7, 12), admittance_reason: 'Liver disease',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2013, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.count.should be_zero
  end

  it 'does not contain instances for mzkh_patients admitted for Liver disease in another year' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 218480
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2013, 5, 23), admission_reason_code: 'Diabetes',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2011, 7, 12), admittance_reason: 'Liver disease',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2013, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.count.should be_zero
  end

  it 'does not contain instances for mzkh_patients treated in the umcg by another doctor' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 12345
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2013, 5, 23), admission_reason_code: 'Diabetes',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2013, 7, 12), admittance_reason: 'Liver disease',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2013, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.count.should be_zero
  end

  it 'does not contain instances for mzkh_patients treated for Liver disease in another year' do
    mzkh_patient_name = 'mzkh_diabetes_patient'
    umcg_doctor_id = 218480
    epd_patient_id = 110
    mzkh_local_nr = 2030
    mzkh_role = Fabricate :gi, role: 'MZKH', local_nr: mzkh_local_nr, epd_patient_id: epd_patient_id
    m_patient = Fabricate :m_patient, name: mzkh_patient_name, m_patient_nr: mzkh_local_nr
    mzkh_admission = Fabricate :m_patient_admitted_for_admission_reason_on_date,
                               date: Date.new(2013, 5, 23), admission_reason_code: 'Diabetes',
                               m_patient_nr: mzkh_local_nr
    umcg_local_nr = 112
    umcg_role = Fabricate :gi, role: 'UMCG', local_nr: umcg_local_nr, epd_patient_id: epd_patient_id
    u_patient = Fabricate :u_patient, u_patient_nr: umcg_local_nr
    umcg_admission = Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                               date: Date.new(2013, 7, 12), admittance_reason: 'Liver disease',
                               u_patient_nr: umcg_local_nr
    u_treatment = Fabricate :u_patient_treatment, date: Date.new(2012, 8, 9), u_patient_nr: umcg_local_nr, doctor_id: umcg_doctor_id
    MzkhDiabetesPatient.count.should be_zero
  end

end
