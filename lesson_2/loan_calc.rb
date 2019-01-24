def invalid
  puts "Invalid input. Please enter a positive number."
  puts ""
end

# take in loan amount, APR, and duration from user
amount = 0
loop do
  puts "What is your total loan amount?"
  print "Dollars: "
  amount = gets.chomp.to_i
  break if amount > 0
  invalid
end
puts ""

apr = 0
loop do
  puts "What is the APR for your loan?"
  puts "(eg. for 5% enter '5', for 2.5% enter '2.5')"
  print "Percentage: "
  apr = gets.chomp
  break if apr.to_i > 0
  invalid
end
puts ""

apr = apr.to_f / 100

dur_years = 0
loop do
  puts "What is the duration of your loan?"
  print "Years: "
  dur_years = gets.chomp.to_i
  break if dur_years > 0
  invalid
end
puts ""

# calculate monthly interest rate and duration in months
mpr = apr / 12
dur_months = dur_years * 12

# give monthly payment amount to pay off loan in loan duration
payments = amount * (mpr / (1 - (1 + mpr)**-dur_months))
interest = (payments * dur_months) - amount
puts "For a #{dur_years} year loan of $#{amount} and an APR of #{apr * 100}%," /
     " you will pay $#{payments.round(2)} per month."
puts "You'll pay a total of $#{interest.round(2)} in interest!"
