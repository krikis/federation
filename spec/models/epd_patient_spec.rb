require 'spec_helper'

describe EpdPatient do

  context 'when a MZKH role exists' do
    let(:local_nr) { 'some_local_nr' }
    let(:role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'MZKH',
                local_nr: local_nr,
                epd_patient_id: 'some_epd_patient_id'
    end

    context 'and an MPatient exists with the role local nr' do
      let(:m_patient) { Fabricate :m_patient, m_patient_nr: local_nr }

      it 'returns this MPatient' do
        EpdPatient.first.id.should eq(m_patient.id)
      end
    end
  end

end