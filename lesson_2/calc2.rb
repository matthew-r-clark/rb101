# Calc: A command line calculator program that:
#
# 1. asks for two numbers
# 2. asks for the type of operation:
#      add, subtract, multiply, or divide
# 3. displays the result

require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')

puts "=> English is default language, hit 'Enter' to continue. Para español, presione 's'."
lang = 'en'
lang = 'sp' if gets.chomp.downcase == 's'

def calculator(x, y, op)
  y = y.to_f if op == '/'
  x.method(op).(y)
end

def prompt(message)
  puts "=> #{message}"
end

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def valid_number?(num)
  num.is_a?(Integer) && num != 0
end

prompt(messages('welcome', lang))

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt(messages('valid_name', lang))
  else
    break
  end
end

prompt(messages('greeting', lang) + " #{name}!")

loop do   # main loop

  operation = ''
  prompt(messages('operation_prompt', lang))
  loop do
    operation = gets.chomp
    break if "+-*/".include?(operation)
    prompt(messages('valid_operation', lang))
  end

  x = ''
  loop do
    prompt(messages('example', lang) + operation + messages('x_prompt', lang))
    x = gets.chomp.to_i
    break if valid_number?(x)
    prompt(messages('valid_number', lang))
  end

  y = ''
  loop do
    prompt(messages('example', lang) + operation + messages('y_prompt', lang))
    y = gets.chomp.to_i
    break if valid_number?(y)
    prompt(messages('valid_number', lang))
  end

  prompt("#{x} #{operation} #{y} = #{calculator(x, y, operation)}")

  prompt(messages('again_prompt', lang))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('closing', lang))
