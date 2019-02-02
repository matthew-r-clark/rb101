ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

lowest_age = Float::INFINITY

ages.each do |key, value|
  if value < lowest_age
    lowest_age = value
  end
end

puts lowest_age
