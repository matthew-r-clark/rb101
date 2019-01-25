# Rock, Paper, Scissors, Spock, Lizard

def prompt(msg, new_line = false)
  head = new_line ? "\n" : ""
  puts "#{head}=> #{msg}"
end

def display_choices(arr)
  count = 1
  arr.each do |word|
    prompt "   #{count}. #{word}"
    count += 1
  end
end

def win?(first, second)
  WINNING_PATHS[first].include?(second)
end

def display_results(user, comp)
  if win?(comp, user)
    "Computer wins!"
  elsif win?(user, comp)
    "Player wins!"
  else
    "Draw."
  end
end

def determine_winner(user, comp)
  if win?(comp, user)
    :computer
  elsif win?(user, comp)
    :player
  end
end

def computer_choice
  CHOICES.sample.downcase.to_sym
end

def update_score(score, winner)
  score[winner] += 1 unless winner.nil?
end

def display_score(score)
  "Player: #{score[:player]}\n=> Computer: #{score[:computer]}"
end

WINNING_PATHS = {
  rock: [:scissors, :lizard],
  paper: [:rock, :spock],
  scissors: [:paper, :lizard],
  spock: [:scissors, :rock],
  lizard: [:spock, :paper]
}

CHOICES = %w(Rock Paper Scissors Spock Lizard)

prompt "Welcome to #{CHOICES.join(', ')}!"

loop do # game loop
  score = { player: 0, computer: 0 }

  loop do # match loop
    user = 0
    loop do # user input loop
      prompt("Which would you like to select? Enter a number (1-5):", true)
      display_choices(CHOICES)
      user = gets.chomp.to_i
      break if user > 0 && user < 6
      puts "Invalid input. You must type either '1', '2', or '3'."
    end
    user = CHOICES[user - 1].downcase.to_sym

    comp = computer_choice
    prompt("Your choice is #{user}.", true)
    prompt "Computer's choice is #{comp}."

    prompt(display_results(user, comp), true)
    winner = determine_winner(user, comp)
    update_score(score, winner)
    prompt(display_score(score), true)
    break if score[:player] == 5 || score[:computer] == 5
  end
  score.each do |k, v|
    if v == 5
      prompt("#{k.to_s.capitalize} is the winner!", true)
    end
  end

  prompt("Play again?", true)
  break unless gets.chomp.downcase.start_with?('y')
end
