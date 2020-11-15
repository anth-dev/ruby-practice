# frozen_string_literal: true

require 'pry'

# Write a method #fibs which takes a number and returns that many members of
#   the fibonacci sequence. Use iteration for this solution.
def fibs(n)
  current_n = 2
  a = 0
  b = 1
  fibonacci_sequence = []

  fibonacci_sequence.push(a)
  return fibonacci_sequence if n.zero?

  fibonacci_sequence.push(b)
  return fibonacci_sequence if n == 1

  until current_n > n
    sum = a + b
    fibonacci_sequence.push(sum)

    a = b
    b = sum

    current_n += 1
  end

  fibonacci_sequence
end

p fibs(10)

# Now write another method #fibs_rec which solves the same problem recursively.
#   This can be done in just 3 lines (or 1 if you’re crazy, but don’t consider
#   either of these lengths a requirement… just get it done).
def fibs_rec(n, current_n = 0, fibonacci_sequence = [], a = 0, b = 1)
  if current_n.zero?
    fibonacci_sequence.push(0)
  elsif current_n == 1
    fibonacci_sequence.push(1)
  else
    sum = a + b
    fibonacci_sequence.push(sum)
    a = b
    b = sum
  end
  
  return fibonacci_sequence if n == current_n
  fibs_rec(n, current_n + 1, fibonacci_sequence, a, b)
end

p fibs_rec(10)