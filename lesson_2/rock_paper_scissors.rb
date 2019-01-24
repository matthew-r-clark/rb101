def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  (first == 1 && second == 2) ||
    (first == 2 && second == 3) ||
    (first == 3 && second == 1)
end

def display_results(user, comp)
  if win?(user, comp)
    "Computer wins!"
  elsif win?(comp, user)
    "Player wins!"
  else
    "Draw."
  end
end

def computer_choice
  rand(1..3)
end

prompt "Welcome to Rock, Paper, Scissors!"

choices = ['rock', 'paper', 'scissors']

loop do
  user = 0
  loop do
    prompt "Which would you like to select? Enter 1, 2, or 3 to choose:"
    prompt "  1. Rock"
    prompt "  2. Paper"
    prompt "  3. Scissors"
    user = gets.chomp.to_i
    break if user > 0 && user < 4
    puts "Invalid input. You must type either '1', '2', or '3'."
  end

  comp = computer_choice
  prompt "Your choice is #{choices[user - 1]}."
  prompt "Computer's choice is #{choices[comp - 1]}."

  prompt(display_results(user, comp))

  puts ""
  prompt("Play again?")
  break unless gets.chomp.downcase.start_with?('y')
end
