require 'spec_helper'

describe MartiniPatient do

  context 'when a MZKH role exists' do
    let(:mzkh_local_nr) { 111 }
    let!(:mzkh_role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'MZKH',
                local_nr: mzkh_local_nr,
                epd_patient_id: 110
    end

    it 'has an instance that contains the role attributes' do
      MartiniPatient.first.attributes.should eq("martini_patient_nr" => mzkh_role.local_nr,
                                                "epd_patient_id" => mzkh_role.epd_patient_id)
    end
  end

end