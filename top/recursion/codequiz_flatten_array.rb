# frozen_string_literal: true

require 'pry'

# Define a recursive function that flattens an array. The method should convert
# [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

def flatten_array(array, flattened_array = [])
  return flattened_array if array.empty?

  if array.first.instance_of?(Array)

    array.first.first.instance_of?(Array) ? flatten_array(array.first.first, flattened_array) : flattened_array.push(array.first.shift)

    array.shift if array.first.empty? || array.first == [[]]
  else

    flattened_array.push(array.shift)
  end

  flatten_array(array, flattened_array)
end

p flatten_array([[1, 2], [3, 4]]) # => [1, 2, 3, 4]
p flatten_array([[1, [8, 9]], [3, 4]]) # => [1, 8, 9, 3, 4]
