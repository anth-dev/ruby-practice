# frozen_string_literal: true

# Define a recursive function that finds the factorial of a number.
# A factorial is the product of all positive integers less than or
# equal to n.

def factorial(number)
  return 1 if number <= 1

  number * factorial(number - 1)
end

p factorial(0) # => 1
p factorial(1) # => 1 (base case!)
p factorial(2) # => 2
p factorial(3) # => 6
p factorial(9) # => 362,880
