# frozen_string_literal: true

# Define a recursive function that returns true if a string is a palindrome
# and false otherwise.

def palindrome?(string, left_index = 0, right_index = string.length - 1)
  return false if string[left_index] != string[right_index]
  return true if left_index == right_index

  # increment left_index
  left_index += 1

  # decrement right_index
  right_index -= 1

  # call itself
  palindrome?(string, left_index, right_index)
end

puts palindrome?('string')  # => false
puts palindrome?('bob')     # => true
