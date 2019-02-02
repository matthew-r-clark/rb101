munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def add_age_group(hash)
  hash.each do |_, data|
    case data['age']
    when 0..17
      data['age_group'] = 'kid'
    when 18..64
      data['age_group'] = 'adult'
    else
      data['age_group'] = 'senior'
    end
  end
end

add_age_group(munsters)
puts munsters
