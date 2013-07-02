Fabricator(:m_patient) do
  name { ['some_name', 'other_name'][rand.round] }
  date { (5000 + rand(10000)).days.ago }
  gender { ['M', 'F'][rand.round] }
end