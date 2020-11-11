# frozen_string_literal: true

# Define a recursive function that takes an argument n and returns the
# fibonacci value of that position.
# The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should
# return 5 and fib(6) should return 8.

def fibonacci_value(desired_n, current_n = 2, a = 0, b = 1)
  # If F0 or F1 are requested return the starting a or b value.
  return a if desired_n.zero?
  return b if desired_n == 1

  # Calculate the sum for the current fibonnaci number.
  sum = a + b

  # If the current_n and desired_n match, return the calculated sum
  return sum if desired_n == current_n

  # If they don't match then call the fibonacci_value method again to calculate
  # the next fibonacci number.
  fibonacci_value(desired_n, current_n + 1, b, sum)
end

puts fibonacci_value(0) # => 0
puts fibonacci_value(1) # => 1
puts fibonacci_value(2) # => 1
puts fibonacci_value(3) # => 2
puts fibonacci_value(4) # => 3
puts fibonacci_value(5) # => 5
