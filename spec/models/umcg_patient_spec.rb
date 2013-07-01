require 'spec_helper'

describe UmcgPatient do

  context 'when a UMCG role exists' do
    let(:umcg_local_nr) { 112 }
    let!(:umcg_role) do
      Fabricate :gi,
                role: 'UMCG',
                local_nr: umcg_local_nr,
                epd_patient_id: 110
    end

    it 'has an instance that contains the role attributes' do
      UmcgPatient.first.attributes.should eq("umcg_patient_nr" => umcg_role.local_nr,
                                             "epd_patient_id" => umcg_role.epd_patient_id,
                                             "mobile_phone_nr" => nil,
                                             "office_phone_nr" => nil)
    end

    context 'when a UPatient phone is present' do
      let!(:u_patient) { UPatient.create u_patient_nr: umcg_local_nr }
      let!(:u_home_phone) { UPatientHasPhone.create u_patient_nr: umcg_local_nr, phone: 12345678 }
      let!(:u_mobile_phone) { UPatientHasPhone.create u_patient_nr: umcg_local_nr, phone: 123456789 }
      let!(:u_office_phone) { UPatientHasPhone.create u_patient_nr: umcg_local_nr, phone: 1234567890 }

      it 'has an instance that contains this phone' do
        UmcgPatient.first.attributes.should eq("umcg_patient_nr" => umcg_role.local_nr,
                                               "epd_patient_id" => umcg_role.epd_patient_id,
                                               "mobile_phone_nr" => u_mobile_phone.phone,
                                               "office_phone_nr" => u_office_phone.phone)
      end
    end
  end

end