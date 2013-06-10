require 'spec_helper'

describe EpdPatient do

  context 'when a MZKH role exists' do
    let(:local_nr) { 110 }
    let!(:role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'MZKH',
                local_nr: local_nr,
                epd_patient_id: 111
    end

    context 'and an MPatient exists with the role local nr' do
      let!(:m_patient) { Fabricate :m_patient, m_patient_nr: local_nr }

      it 'returns this MPatient' do
        EpdPatient.first.epd_patient_id.should eq(role.epd_patient_id)
      end
    end
  end

  context 'when a UMCG role exists' do
    let(:local_nr) { 110 }
    let!(:role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'UMCG',
                local_nr: local_nr,
                epd_patient_id: 111
    end

    context 'and a UPatient exists with the role local nr' do
      let!(:u_patient) { Fabricate :u_patient, u_patient_nr: local_nr }

      it 'returns this UPatient' do
        EpdPatient.first.epd_patient_id.should eq(role.epd_patient_id)
      end
    end
  end

end