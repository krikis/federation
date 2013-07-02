Fabricator(:m_patient_is_allergic_to_drug) do
  drug_code { ['drug_1', 'drug_2'][rand.round] }
end