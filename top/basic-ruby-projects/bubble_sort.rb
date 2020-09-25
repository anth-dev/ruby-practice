=begin
Algorithm:
For each element in list look at element and element directly to the right.
If out of order, swap elements.
=end

require 'pry'

def bubble_sort(unsorted_numbers)

  # Make an array to store sorted values
  sorted_numbers = []

  # As long as there are numbers to sort, keep sorting.
  while unsorted_numbers.length > 0 do

    # Look at the first two numbers and determine their correct order.
    sorted_pair = sort_pair(unsorted_numbers[0], unsorted_numbers[1])

    # Reassign the array elements to correspond with correct order.
    unsorted_numbers[0] = sorted_pair[0]
    unsorted_numbers[1] = sorted_pair[1]

    # After the whole thing has gone through once and you have the highest
    # number pop the element out and add it to the front of sorted_numbers

  end
end

def sort_pair(first_number, second_number)
  first_number < second_number ? [first_number, second_number] : [second_number, first_number]
end

p bubble_sort([4,3,78,2,0,2])

=begin
best way to iterate over? do we need the original array returned or the the
modified one? do we need a destructive method?
do we need access to the iterator?

how to compare and swap? maybe compare and a combination of insert and delete?
=end