# frozen_string_literal: true

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
