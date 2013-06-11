require 'spec_helper'

describe EpdPatient do

  context 'when an MZKH role exists' do
    let(:epd_patient_id) { 110 }
    let(:mzkh_local_nr) { 111 }
    let!(:mzkh_role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'MZKH',
                local_nr: mzkh_local_nr,
                epd_patient_id: epd_patient_id
    end

    context 'and an MPatient exists with the role local nr' do
      let!(:m_patient) do
        Fabricate :m_patient, m_patient_nr: mzkh_local_nr, date: Date.today,
                              gender: 'M', name: 'some_name', phone_number: 87654321
      end

      it 'an EpdPatient exists with the role EpdPatientId' do
        EpdPatient.first.epd_patient_id.should eq(epd_patient_id)
      end

      it 'an EpdPatient exists with the MPatient date' do
        EpdPatient.first.date.to_s.should eq(m_patient.date.to_s)
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
    let(:epd_patient_id) { 110 }
    let(:umcg_local_nr) { 112 }
    let!(:umcg_role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'UMCG',
                local_nr: umcg_local_nr,
                epd_patient_id: epd_patient_id
    end

    context 'and a UPatient exists with the role local nr' do
      let!(:u_patient) do
        Fabricate :u_patient, u_patient_nr: umcg_local_nr, date: 1.day.ago,
                              gender: 'Female', name: 'some_other_name'
      end

      it 'an EpdPatient exists with the role EpdPatientId' do
        EpdPatient.first.epd_patient_id.should eq(epd_patient_id)
      end

      it 'an EpdPatient exists with the UPatient date' do
        EpdPatient.first.date.to_s.should eq(u_patient.date.to_s)
      end

      it 'an EpdPatient exists with the UPatient gender' do
        EpdPatient.first.gender.should eq(u_patient.gender)
      end

      it 'an EpdPatient exists with the UPatient name' do
        EpdPatient.first.name.should eq(u_patient.name)
      end

      context 'and a UPatientHasPhone exists with the UPatient u_patient_nr' do
        let!(:u_patient_phone) { UPatientHasPhone.create u_patient_nr: umcg_local_nr, phone: 12345678 }

        it 'an EpdPatient exists with the UPatient phone_number' do
          EpdPatient.first.home_phone_nr.should eq(u_patient_phone.phone)
        end
      end
    end
  end

  context 'when both an MZKH and UMCG role exists' do
    let(:epd_patient_id) { 110 }
    let(:mzkh_local_nr) { 111 }
    let!(:mzkh_role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'MZKH',
                local_nr: mzkh_local_nr,
                epd_patient_id: epd_patient_id
    end
    let(:umcg_local_nr) { 112 }
    let!(:umcg_role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'UMCG',
                local_nr: umcg_local_nr,
                epd_patient_id: epd_patient_id
    end

    context 'and both an MPatient and UPatient exists' do
      let!(:m_patient) do
        Fabricate :m_patient, m_patient_nr: mzkh_local_nr, date: Date.today, name: 'some_name'
      end
      let!(:u_patient) do
        Fabricate :u_patient, u_patient_nr: umcg_local_nr, gender: 'Female'
      end
      let!(:u_patient_phone) { UPatientHasPhone.create u_patient_nr: umcg_local_nr, phone: 12345678 }

      it 'returns the coalescence of both patients' do
        EpdPatient.first.attributes.should eq("epd_patient_id" => epd_patient_id,
                                              "date" => m_patient.date.to_s,
                                              "gender" => u_patient.gender,
                                              "name" => m_patient.name,
                                              "home_phone_nr" => u_patient_phone.phone)
      end
    end
  end

end