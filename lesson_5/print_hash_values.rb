munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def print_family(hsh)
  hsh.each do |name, info|
    puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
  end
end

print_family(munsters)
