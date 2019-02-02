flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

def abbreviate(arr)
  arr.map { |name| name[0, 3] }
end

puts abbreviate(flintstones)
