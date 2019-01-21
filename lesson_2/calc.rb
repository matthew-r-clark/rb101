# Calc: A command line calculator program that:
#
# 1. asks for two numbers
# 2. asks for the type of operation:
#      add, subtract, multiply, or divide
# 3. displays the result
#
# Using explicit module references and method call perentheses.

def calculator(x, y, op)
  y = y.to_f if op == '/'
  x.method(op).(y)
end

Kernel.puts("What type of operation would you like to perform? (+, -, *, /)")
operation = Kernel.gets().chomp()

Kernel.puts("In the example (x #{operation} y = ?) what would you like 'x' to be?")
x = Kernel.gets().chomp().to_i()
Kernel.puts("In the example (x #{operation} y = ?) what would you like 'y' to be?")
y = Kernel.gets().chomp().to_i()

Kernel.puts("#{x} #{operation} #{y} = #{calculator(x, y, operation)}")
