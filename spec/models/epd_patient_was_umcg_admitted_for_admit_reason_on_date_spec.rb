require 'spec_helper'

describe EpdPatientWasUmcgAdmittedForAdmitReasonOnDate do

  context 'when an admission exists' do
    let(:umcg_local_nr) { 112 }
    let!(:umcg_admission) do
      Fabricate :u_patient, u_patient_nr: umcg_local_nr
      Fabricate :u_patient_was_admitted_for_admittance_reason_on_date,
                date: Date.today,
                admittance_reason: 'admission_reason',
                u_patient_nr: umcg_local_nr
    end

    it 'has an instance containing the admission attributes' do
      umcg_role = Gi.where(local_nr: umcg_local_nr, role: 'UMCG').first
      described_class.first.attributes.should eq("date" => umcg_admission.date,
                                                 "admit_reason_code" => umcg_admission.admittance_reason,
                                                 "epd_patient_id" => umcg_role.epd_patient_id)
    end
  end

end