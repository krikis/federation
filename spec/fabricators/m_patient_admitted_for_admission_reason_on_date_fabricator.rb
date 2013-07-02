Fabricator(:m_patient_admitted_for_admission_reason_on_date) do
  admission_reason_code { ['reason_1', 'reason_2'][rand.round] }
  date { rand(2000).days.ago.to_date }
end