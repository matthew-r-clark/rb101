munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def total_male_ages(hsh)
  total_age = 0
  hsh.each do |_, person|
    total_age += person['age'] if person['gender'] == 'male'
  end
  total_age
end

puts total_male_ages(munsters) == 444 ? 'Pass' : 'Fail'
