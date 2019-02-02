my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(numbers, multiplier)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier

    counter += 1
  end

  multiplied_numbers
end

p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
