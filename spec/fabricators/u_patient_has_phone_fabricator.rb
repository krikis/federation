Fabricator(:u_patient_has_phone) do
  phone { [123456780, 87654321][rand.round] }
end