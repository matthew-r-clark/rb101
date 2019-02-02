flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

puts "Flintstones array: #{flintstones}"
puts ""
puts "Flintstones hash: #{flintstones_hash}"
