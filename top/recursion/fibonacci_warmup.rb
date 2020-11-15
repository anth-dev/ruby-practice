# frozen_string_literal: true

# Write a method #fibs which takes a number and returns that many members of
#   the fibonacci sequence. Use iteration for this solution.
def fibs(n)
  # Use variables to store the current n and values for a, b, and an array to
  #   eventually return.
  current_n = 2
  a = 0
  b = 1
  fibonacci_sequence = []

  fibonacci_sequence.push(a)
  return fibonacci_sequence if n.zero?

  fibonacci_sequence.push(b)
  return fibonacci_sequence if n == 1

  # While the current n doesn't equal n, calculate fibonacci numbers pushing
  #   them to an array that will be returned at the end of the method.
  until current_n > n
    # Calculate fibonacci numbers and push them to the fibonacci_sequence
    #   array.
    sum = a + b
    fibonacci_sequence.push(sum)

    # Prepare variables for the next iteration of the loop.
    a = b
    b = sum

    # Increment current_n.
    current_n += 1
  end

  # Return the array of fibonacci numbers when the while loop has completed.
  fibonacci_sequence
end

p fibs(10)

# Now write another method #fibs_rec which solves the same problem recursively.
#   This can be done in just 3 lines (or 1 if you’re crazy, but don’t consider
#   either of these lengths a requirement… just get it done).
