# frozen_string_literal: true

def merge_sort(unsorted_array)
  # If unsorted_array contains more than one item, split it in half and call
  #   merge_sort on each of the two halfs.

  # When the two halfs are returned sorted, merge them together in order.

  # If unsorted_array is just one item consider it sorted and return it back to
  #   the method that called it.
  unsorted_array
end

p merge_sort([10, 2, 9, 4, 1, 6, 8, 5, 7, 3])
