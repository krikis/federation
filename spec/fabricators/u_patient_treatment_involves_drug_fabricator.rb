Fabricator(:u_patient_treatment_involves_drug) do
  drug_code { ['drug_1', 'drug_2'][rand.round] }
end