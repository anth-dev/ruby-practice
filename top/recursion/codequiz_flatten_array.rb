# frozen_string_literal: true

require 'pry'

# Define a recursive function that flattens an array. The method should convert
# [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

def flatten_array(array, flattened_array = [])
  # When there are no elements left, return the flattened array.
  return flattened_array if array.empty?

  # Check if the first element of the array is a nested array. If so then
  # iterate over the nested array shifting each item out and and pushing
  # the item to the flattened_array that will eventually be returned.
  if array.first.class == Array
    # Iterate over the nested array pushing each element to flattened_array.
    # FIXME: This is currently having an issue when running into arrays nested
    # deeper than one level.
    array.first.each do |element|
      flattened_array.push(element)
    end

    # Remove the first element of the array (it should be the empty nested
    # array)
    array.shift()
  else

    # Here we should have an array element that isn't a nested array. Unshift
    # the element to the start of the flattened_array.
    flattened_array.push(array[0])
  end


  # If there are still array elements call flatten_array again.
  flatten_array(array, flattened_array)
end

p flatten_array([[1, 2], [3, 4]]) # => [1, 2, 3, 4]
p flatten_array([[1, [8, 9]], [3, 4]]) # => [1, 8, 9, 3, 4]
