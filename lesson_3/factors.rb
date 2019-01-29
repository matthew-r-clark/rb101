def factors(number)
  factors = []
  (1..number).each do |divisor|
    factors << number / divisor if number % divisor == 0
  rescue
    return nil
  end
  factors.reverse
end

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

puts "the factors for 5 are #{factors(5)}"
puts "the factors for 9 are #{factors(9)}"
puts "the factors for 21 are #{factors(21)}"
puts "the factors for 0 are #{factors(0)}"
puts "the factors for -3 are #{factors(-3)}"

# BONUS 1: 'number % divisor == 0' makes sure that the divisor will divide the
#          number evenly, without a remainder.
# BONUS 2: The second to last line is the return value. This method returns
#          the 'factors' array.
