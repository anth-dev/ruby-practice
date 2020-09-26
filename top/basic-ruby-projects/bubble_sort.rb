=begin
Algorithm:
For each element in list look at element and element directly to the right.
If out of order, swap elements.
=end

def bubble_sort(unsorted_numbers)

  # Make an array to hold the highest number as it bubbles up.
  sorted_numbers = []

  # As long as there are numbers to sort, keep sorting.
  while unsorted_numbers.length > 0 do

    # Use a variable to track the current starting index.
    start_index = 0

      # Keep looping through the array until we are on the last pair
      while start_index < unsorted_numbers.length - 1 do

        # If we get down to the last item break out of the loop.
        if unsorted_numbers.length == 1
          break

        end

        # Select a pair of numbers 
        unsorted_pair = select_pair(unsorted_numbers, start_index)

        # Look at the first two numbers and determine their correct order.
        sorted_pair = sort_pair(unsorted_pair[0], unsorted_pair[1])

        # Reassign the array elements to correspond with correct order.
        unsorted_numbers[start_index] = sorted_pair[0]
        unsorted_numbers[start_index + 1] = sorted_pair[1]

        # Increment the start_index
        start_index += 1

      end

    # After the whole thing has gone through once and you have the highest
    # number pop the element out and add it to the front of sorted_numbers.
    sorted_numbers.unshift(unsorted_numbers.pop)

  end

  # When done return the sorted numbers.
  sorted_numbers

end

def sort_pair(first_number, second_number)
  first_number < second_number ? [first_number, second_number] : [second_number, first_number]
end

def select_pair(array_of_numbers, start_index)
  pair = [array_of_numbers[start_index], array_of_numbers[start_index + 1]]
end

p bubble_sort([4,3,78,2,0,2])