def create_uuid
  uuid = ''
  valid_chars = ('a'..'z').to_a + (0..9).to_a
  counter = 36

  loop do
    break if counter == 0

    if [28, 23, 18, 13].include?(counter)
      uuid << '-'
    else
      uuid << valid_chars.sample.to_s
    end

    counter -= 1
  end
  uuid
end

puts create_uuid


# Example from Launch School
# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }
#
#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end
#
#   uuid
# end
