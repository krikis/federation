require 'spec_helper'

describe CommonObject do

  context 'when an MPatient exists' do
    let(:mzkh_local_nr) { 111 }
    let!(:m_patient) do
      Fabricate :m_patient, m_patient_nr: mzkh_local_nr, date: Date.today,
                            gender: 'M', name: 'some_name', phone_number: 87654321
    end

    it 'has no instance containing this MPatient attributes' do
      CommonObject.count.should eq(0)
    end
  end

  context 'when a UPatient exists' do
    let(:umcg_local_nr) { 112 }
    let!(:u_patient) do
      Fabricate :u_patient, u_patient_nr: umcg_local_nr, date: 1.day.ago.to_date,
                            gender: 'Female', name: 'some_other_name'
    end

    it 'has no instance containing this UPatient attributes' do
      CommonObject.count.should eq(0)
    end
  end

  context 'when both an MPatient and UPatient exists' do
    let(:epd_patient_id) { 110 }
    let(:mzkh_local_nr) { 111 }
    let(:umcg_local_nr) { 112 }
    let!(:m_patient) do
      Fabricate :m_patient, m_patient_nr: mzkh_local_nr, date: 3.days.ago.to_date, name: 'some_name'
    end
    let!(:u_patient) do
      Fabricate :u_patient, u_patient_nr: umcg_local_nr, date: Date.today, gender: 'Female', name: ''
    end
    let!(:u_patient_phone) { UPatientHasPhone.create u_patient_nr: umcg_local_nr, phone: 12345678 }

    context 'and the associated roles have the same epd_patient_id' do
      before do
        Gi.where(local_nr: mzkh_local_nr, role: 'MZKH').first.update_attribute :epd_patient_id, epd_patient_id
        Gi.where(local_nr: umcg_local_nr, role: 'UMCG').first.update_attribute :epd_patient_id, epd_patient_id
      end

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