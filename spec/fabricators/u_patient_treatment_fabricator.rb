Fabricator(:u_patient_treatment) do
  doctor_id { [10, 11][rand.round] }
end