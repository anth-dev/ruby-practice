# frozen_string_literal: true

def merge_sort(unsorted_array)
  if unsorted_array.length > 1
    left_side = unsorted_array.take(unsorted_array.length / 2)
    right_side = unsorted_array.drop(unsorted_array.length / 2)

    sorted_left_side = merge_sort(left_side)
    sorted_right_side = merge_sort(right_side)

    sorted_array = []
    until sorted_left_side.empty? || sorted_right_side.empty?
      sorted_left_side.first < sorted_right_side.first ? sorted_array.push(sorted_left_side.shift) : sorted_array.push(sorted_right_side.shift)
    end
    sorted_array.concat(sorted_left_side, sorted_right_side)
  else
    unsorted_array
  end
end

p merge_sort([10, 2, 9, 4, 1, 6, 8, 5, 7, 3])
