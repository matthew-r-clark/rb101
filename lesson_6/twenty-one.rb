CARD_TYPES = [2, 3, 4, 5, 6, 7, 8, 9, 10] +
             ['Jack', 'Queen', 'King', 'Ace']
SUITS = ['Clubs', 'Spades', 'Hearts', 'Diamonds']

def prompt(msg)
  puts "> #{msg}"
end

def initialize_deck
  deck = {}
  CARD_TYPES.each do |card|
    SUITS.each do |suit|
      value = nil
      if card.to_i > 0
        value = card
      elsif card == 'Ace'
        value = 11
      else
        value = 10
      end
      deck["#{card} of #{suit}"] = value
    end
  end
  deck
end

def deal_hand!(deck)
  hand = {}
  2.times do |_|
    get_card!(deck, hand)
  end
  ace_adjust!(hand)
end

def get_card!(deck, hand)
  key = deck.keys.sample
  hand[key] = deck[key]
  deck.delete(key)
end

def check_hand_value(hand)
  hand.values.reduce(:+)
end

def ace_adjust!(hand)
  hand.each do |card, value|
    if value == 11 && check_hand_value(hand) > 21
      hand[card] = 1
    end
  end
  hand
end

def bust?(hand_total)
  return true if hand_total > 21
  false
end

def hit!(deck, hand)
  get_card!(deck, hand)
  ace_adjust!(hand)
end

def display_hands(dealer, player)
  system "clear"
  prompt "Dealer has #{dealer.keys.first} and another card."
  puts ""
  prompt "You have the following cards:"
  player.keys.each do |card|
    prompt card.to_s
  end
  prompt ""
  prompt "For a total score of: #{player.values.reduce(:+)}."
  puts ""
end

def determine_winner(dealer, player)
  if bust?(dealer) || player > dealer
    display_winner(player, dealer, 'Player')
  elsif bust?(player) || dealer >= player
    display_winner(dealer, player, 'Dealer')
  end
end

def display_winner(winner, loser, title)
  if winner == loser
    prompt "Tie goes to dealer!"
  else
    prompt "#{title} wins!"
  end
  prompt "#{winner} to #{loser}."
end

dealer_total = 0
player_total = 0

loop do # main game loop
  deck = initialize_deck

  player_hand = deal_hand!(deck)
  player_total = check_hand_value(player_hand)
  dealer_hand = deal_hand!(deck)
  dealer_total = check_hand_value(dealer_hand)
  display_hands(dealer_hand, player_hand)

  loop do # player's turn
    prompt "Do you want to hit ('h') or stay ('s')?"
    answer = gets.chomp
    break if answer.downcase[0] == 's'

    if answer.downcase[0] == 'h'
      player_hand = hit!(deck, player_hand)
      player_total = check_hand_value(player_hand)
      display_hands(dealer_hand, player_hand)
    else
      prompt "Invalid input. Please enter only an 'h' or an 's'."
    end
    if bust?(player_total)
      prompt "You busted!"
      break
    end
  end

  loop do # dealer's turn
    break if bust?(player_total)
    if dealer_total < 17
      dealer_hand = hit!(deck, dealer_hand)
      dealer_total = check_hand_value(dealer_hand)
    elsif bust?(dealer_total)
      prompt "Dealer busted!"
      break
    else
      break
    end
  end

  determine_winner(dealer_total, player_total)

  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase[0] == 'y'
end
