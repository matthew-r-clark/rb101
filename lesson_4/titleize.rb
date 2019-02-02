words = "i'm writing a sentence that needs to be capitalized!"

def titleize(str)
  words = str.split
  words.map { |word| word.capitalize! }
  words.join(' ')
end

puts titleize(words)
