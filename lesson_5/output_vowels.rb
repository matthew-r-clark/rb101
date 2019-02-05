hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

vowels = ''

hsh.each_value do |arr|
  arr.each do |word|
    word.chars.each do |letter|
      vowels << letter if 'aeiou'.include?(letter.downcase)
    end
  end
end

puts vowels
