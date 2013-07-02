Fabricator(:u_patient) do
  name { ['some_name', 'other_name'][rand.round] }
  date { (5000 + rand(10000)).days.ago }
  gender { ['Male', 'Female'][rand.round] }
end