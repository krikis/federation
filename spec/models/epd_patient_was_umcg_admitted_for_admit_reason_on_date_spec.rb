require 'spec_helper'

describe EpdPatientWasUmcgAdmittedForAdmitReasonOnDate do

  context 'when an UMCG role exists' do
    let(:umcg_local_nr) { 112 }
    let!(:umcg_role) do
      Fabricate :gi,
                role: 'umcg',
                local_nr: umcg_local_nr,
                epd_patient_id: 110
    end

    context 'and an admission for this role exists' do
      let!(:umcg_admission) do
        Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                  date: Date.today,
                  admittance_reason: 'admission_reason',
                  u_patient_nr: umcg_local_nr
      end

      it 'has an instance containing the admission attributes' do
        described_class.first.attributes.should eq("date" => umcg_admission.date,
                                                   "admit_reason_code" => umcg_admission.admittance_reason,
                                                   "epd_patient_id" => umcg_role.epd_patient_id)
      end
    end
  end

end