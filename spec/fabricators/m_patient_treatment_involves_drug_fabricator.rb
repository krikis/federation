Fabricator(:m_patient_treatment_involves_drug) do
  date { rand(2000).days.ago.to_date }
  drug_code { ['drug_1', 'drug_2'][rand.round] }
  specialist_id { [110, 111][rand.round] }
end