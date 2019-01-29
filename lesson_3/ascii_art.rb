def print_message(message, lines)
  lines.times do |i|
    if i != 0
      message.insert(0,' ')
    end
    puts message
  end
end

message = "The Flintstones Rock!"

print_message(message, 25)
