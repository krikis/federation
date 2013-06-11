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
      let!(:m_patient) do
        Fabricate :m_patient, m_patient_nr: local_nr, date: Date.today,
                              gender: 'M', name: 'some_name'
      end

      it 'an EpdPatient exists with the role EpdPatientId' do
        EpdPatient.first.epd_patient_id.should eq(role.epd_patient_id)
      end

      it 'an EpdPatient exists with the MPatient date' do
        EpdPatient.first.date.should eq(m_patient.date)
      end

      it 'an EpdPatient exists with the MPatient gender' do
        EpdPatient.first.gender.should eq('Male')
      end

      it 'an EpdPatient exists with the MPatient name' do
        EpdPatient.first.name.should eq(m_patient.name)
      end

      it 'an EpdPatient exists with the MPatient phone_number' do
        EpdPatient.first.home_phone_nr.should eq(m_patient.phone_number)
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

      it 'an EpdPatient exists with the role EpdPatientId' do
        EpdPatient.first.epd_patient_id.should eq(role.epd_patient_id)
      end

      it 'an EpdPatient exists with the UPatient date' do
        EpdPatient.first.date.should eq(u_patient.date)
      end

      it 'an EpdPatient exists with the UPatient gender' do
        EpdPatient.first.gender.should eq(u_patient.gender)
      end

      it 'an EpdPatient exists with the UPatient name' do
        EpdPatient.first.name.should eq(u_patient.name)
      end

      context 'and a UPatientHasPhone exists with the UPatient u_patient_nr' do
        let!(:u_patient_phone) { UPatientHasPhone.create u_patient_nr: local_nr, phone: 12345678 }

        it 'an EpdPatient exists with the UPatient phone_number' do
          EpdPatient.first.home_phone_nr.should eq(u_patient_phone.phone)
        end
      end
    end
  end

end