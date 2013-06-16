require 'spec_helper'

describe CommonObject do

  context 'when an MZKH role exists' do
    let(:mzkh_local_nr) { 111 }
    let!(:mzkh_role) do
      Fabricate :gi,
                role: 'MZKH',
                local_nr: mzkh_local_nr,
                epd_patient_id: 110
    end

    context 'and an MPatient exists with the role local nr' do
      let!(:m_patient) do
        Fabricate :m_patient, m_patient_nr: mzkh_local_nr, date: Date.today,
                              gender: 'M', name: 'some_name', phone_number: 87654321
      end

      it 'has no instance containing this MPatient attributes' do
        CommonObject.count.should eq(0)
      end
    end
  end

  context 'when a UMCG role exists' do
    let(:umcg_local_nr) { 112 }
    let!(:umcg_role) do
      Fabricate :gi,
                role: 'UMCG',
                local_nr: umcg_local_nr,
                epd_patient_id: 110
    end

    context 'and a UPatient exists with the role local nr' do
      let!(:u_patient) do
        Fabricate :u_patient, u_patient_nr: umcg_local_nr, date: 1.day.ago.to_date,
                              gender: 'Female', name: 'some_other_name'
      end

      it 'has no instance containing this UPatient attributes' do
        CommonObject.count.should eq(0)
      end
    end
  end

  context 'when both an MZKH and UMCG role exists' do
    let(:epd_patient_id) { 110 }
    let(:mzkh_local_nr) { 111 }
    let!(:mzkh_role) do
      Fabricate :gi,
                role: 'MZKH',
                local_nr: mzkh_local_nr,
                epd_patient_id: epd_patient_id
    end
    let(:umcg_local_nr) { 112 }
    let!(:umcg_role) do
      Fabricate :gi,
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

      it 'has an instance which is the coalescence of this MPatient and UPatient' do
        CommonObject.first.attributes.should eq("epd_patient_id" => epd_patient_id,
                                              "date" => m_patient.date,
                                              "gender" => u_patient.gender,
                                              "name" => m_patient.name,
                                              "home_phone_nr" => u_patient_phone.phone)
      end
    end
  end

end