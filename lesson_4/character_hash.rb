statement = "The Flintstones Rock"

def character_hash(str)
  characters = {}

  str.each_char do |char|
    if characters.has_key?(char)
      characters[char] += 1
    else
      characters[char] = 1
    end
  end
  characters
end

puts character_hash(statement)
