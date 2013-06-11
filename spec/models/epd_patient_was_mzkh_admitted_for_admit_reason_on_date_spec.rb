require 'spec_helper'

describe EpdPatientWasMzkhAdmittedForAdmitReasonOnDate do

  context 'when an MZKH role exists' do
    let(:mzkh_local_nr) { 111 }
    let!(:mzkh_role) do
      Fabricate :epd_patient_plays_role_using_local_nr,
                role: 'MZKH',
                local_nr: mzkh_local_nr,
                epd_patient_id: 110
    end

    context 'and an admission for this role exists' do
      let!(:mzkh_admission) do
        Fabricate :m_patient_admitted_for_admission_reason_on_date,
                  date: Date.today,
                  admission_reason_code: 'admission_reason',
                  m_patient_nr: mzkh_local_nr
      end

      it 'has an instance containing the admission attributes' do
        described_class.first.attributes.should eq("date" => mzkh_admission.date,
                                                   "admit_reason_code" => mzkh_admission.admission_reason_code,
                                                   "epd_patient_id" => mzkh_role.epd_patient_id)
      end
    end
  end

end