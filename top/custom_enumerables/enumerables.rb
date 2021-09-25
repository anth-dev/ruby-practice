# frozen_string_literal: true

require 'pry'

# These are recreations of some of Ruby's built in enumerable methods.
module Enumerable
  def my_each
    return Enumerator.new(self) unless block_given?

    copy_of_array = dup
    i = 0
    until i == length
      yield copy_of_array.shift
      i += 1
    end
    self
  end

  def my_each_with_index
    return Enumerator.new(self) unless block_given?

    copy_of_array = dup
    i = 0
    until i == length
      yield(copy_of_array.shift, i)
      i += 1
    end
    self
  end

  def my_select
    return Enumerator.new(self) unless block_given?

    array_of_truth = []
    my_each { |element| array_of_truth << element if yield(element) }

    array_of_truth
  end

  def my_all?(pattern = nil, &block)

    block ||= ->(obj){ obj }

    if pattern
      any_false = false
      my_each { |element| any_false = true unless pattern === element }
      return any_false == false ? true : false
    end

    false_or_nil_returned = false

    my_each do |element|
      block_return_value = block.call(element)
      false_or_nil_returned = true if block_return_value.nil? || block_return_value == false
    end

    false_or_nil_returned == false
  end

  def my_any?(pattern = nil, &block)

    block ||= ->(obj) { obj }

    if pattern
      true_returned = false
      my_each { |element| true_returned = true if pattern === element }
      return true_returned == true ? true : false
    end

    true_returned = false
    my_each { |element| true_returned = true if block.call(element) }
    true_returned
  end

  def my_none?(pattern = nil)

    if pattern
      true_returned = false
      my_each { |element| true_returned = true if pattern === element }
      return true_returned == false ? true : false
    end

    unless block_given?
      all_falsey = true
      my_each do |item|
        all_falsey = false unless item.nil? || item == false
      end
      return all_falsey
    end

    true_returned = false
    my_each { |element| true_returned = true if yield(element) }
    true_returned == false ? true : false
  end

  def my_count(item = nil)
    number_of_matches = 0

    if item
      my_each { |element| number_of_matches += 1 if item == element}
      return number_of_matches
    end

    if block_given?
      my_each { |element| number_of_matches += 1 if yield(element) }
      return number_of_matches
    end

    length
  end

  def my_map
    return Enumerator.new(self) unless block_given?

    mapped_items = []

    my_each { |item| mapped_items << yield(item) }
    mapped_items
  end

  def my_inject(a = nil, b = nil)
    items = to_a

    unless block_given?
      total = 0
      b.nil? ? operation = a : (total, operation = a, b)
      items.my_each { |item| total = item.send(operation, total) }
      return total
    end
    
    total = a || 0
    items.my_each { |item| total = yield(total, item) }
    return total
  end
end

numbers = [1, 2, 3, 4, 5]

# # Script for checking my_each

# puts 'my_each - puts each item'
# numbers.my_each { |item| puts item }

# puts 'each - puts each item'
# numbers.each { |item| puts item }

# puts 'my_each_return_value with_block'
# my_each_return_value = numbers.my_each { 'I am in a block!' }
# p my_each_return_value

# puts 'each return value with block'
# each_return_value = numbers.each { 'I am also in a block!' }
# p each_return_value

# puts 'my_each return value without block'
# my_each_return_value = numbers.my_each
# p my_each_return_value

# puts 'each return value without block'
# each_return_value = numbers.each
# p each_return_value

# # Script for checking my_each_with_index

# puts "each_with_index - puts each item and it's index"
# numbers.each_with_index { |item, index| puts "#{index}: #{item}" }

# puts "my_each_with_index - puts each item and it's index"
# numbers.my_each_with_index { |item, index| puts "#{index}: #{item}" }

# puts 'each_with_index return value with block'
# each_with_index_return_value = numbers.each_with_index { 'I am in the block'}
# p each_with_index_return_value

# puts 'my_each_with_index return value with block'
# my_each_with_index_return_value = numbers.my_each_with_index { 'I am in the block'}
# p my_each_with_index_return_value

# puts 'each_with_index return value without block'
# each_with_index_return_value = numbers.each_with_index
# p each_with_index_return_value

# puts 'my_each_with_index return value without block'
# my_each_with_index_return_value = numbers.my_each_with_index
# p my_each_with_index_return_value

# # Script for checking my_select

# puts 'select - return all even numbers'
# select_return_value = numbers.select { |num| num.even? }
# p select_return_value

# puts 'my_select - return all even numbers'
# my_select_return_value = numbers.my_select { |num| num.even? }
# p my_select_return_value

# puts 'select return value without block'
# select_return_value = numbers.select
# p select_return_value

# puts 'my_select return value without block'
# my_select_return_value = numbers.my_select
# p my_select_return_value

# # Script for checking my_all?

# puts 'all? - check [2, 4, 6] for all even numbers'
# all_return_value = [2, 4, 6].all? { |element| element.even? }
# p all_return_value

# puts 'my_all? - check [2, 4, 6] for all even numbers'
# my_all_return_value = [2, 4, 6].my_all? { |element| element.even? }
# p my_all_return_value

# puts 'all? - check numbers array for all even numbers'
# all_return_value = numbers.all? { |element| element.even? }
# p all_return_value

# puts 'my_all? - check numbers array for all even numbers'
# my_all_return_value = numbers.my_all? { |element| element.even? }
# p my_all_return_value

# puts 'all - returns true when no block is provided'
# all_return_value = numbers.all?
# p all_return_value

# puts 'my_all - returns true when no block is provided'
# my_all_return_value = numbers.my_all?
# p all_return_value

# puts 'all - with a pattern of 3'
# all_return_value = numbers.all?(3)
# p all_return_value

# puts 'my_all - with a pattern of 3'
# my_all_return_value = numbers.my_all?(3)
# p my_all_return_value

# puts 'all - with a pattern of Integer'
# all_return_value = numbers.all?(Integer)
# p all_return_value

# puts 'my_all - with a pattern of Integer'
# my_all_return_value = numbers.my_all?(Integer)
# p my_all_return_value

# # Script for checking my_any?

# puts 'any - check if numbers array contains any even numbers'
# any_return_value = numbers.any? { |number| number.even? }
# p any_return_value

# puts 'my_any - check if numbers array contains any even numbers'
# my_any_return_value = numbers.my_any? { |number| number.even? }
# p my_any_return_value

# puts 'any - check if [1, 3, 5] contains any even numbers'
# any_return_value = [1, 3, 5].any? { |number| number.even? }
# p any_return_value

# puts 'my_any - check if [1, 3, 5] contains any even numbers'
# my_any_return_value = [1, 3, 5].my_any? { |number| number.even? }
# p my_any_return_value

# puts 'any - returns true if no block is provided'
# any_return_value = numbers.any?
# p any_return_value

# puts 'my_any - returns true when no block is provided'
# my_any_return_value = numbers.any?
# p my_any_return_value

# puts 'any - with a pattern of 6'
# any_return_value = numbers.any?(6)
# p any_return_value

# puts 'my_any - with a pattern of 6'
# my_any_return_value = numbers.my_any?(6)
# p my_any_return_value

# puts 'any - with a pattern of Integer'
# any_return_value = numbers.any?(Integer)
# p any_return_value

# puts 'my_any - with a pattern of Integer'
# my_any_return_value = numbers.my_any?(Integer)
# p my_any_return_value

# # Script for checking my_none?

# puts "none - check if numbers array doesn't contain 6, should return true"
# none_return_value = numbers.none? { |number| number == 6 }
# p none_return_value

# puts "my_none - check if numbers array doesn't contain 6, should return true"
# my_none_return_value = numbers.my_none? { |number| number == 6 }
# p my_none_return_value

# puts 'none - check if numbers does not contain 4, should return false'
# none_return_value = numbers.none? { |number| number == 4 }
# p none_return_value

# puts 'my_none - check if numbers does not contain 4, should return false'
# my_none_return_value = numbers.my_none? { |number| number == 4 }
# p my_none_return_value

# puts 'none - numbers array with no block given should return false'
# none_return_value = numbers.none?
# p none_return_value

# puts 'my_none - numbers array with no block given should return false'
# my_none_return_value = numbers.my_none?
# p my_none_return_value

# puts 'none - [nil, false] should return true'
# none_return_value = [nil, false].none?
# p none_return_value

# puts 'my_none - [nil, false] should return true'
# my_none_return_value = [nil, false].my_none?
# p my_none_return_value

# puts 'none - with a pattern of 6'
# none_return_value = numbers.none?(6)
# p none_return_value

# puts 'my_none - with a pattern of 6'
# my_none_return_value = numbers.my_none?(6)
# p my_none_return_value

# puts 'none - with a pattern of Integer'
# none_return_value = numbers.none?(Integer)
# p none_return_value

# puts 'my_none - with a pattern of Integer'
# my_none_return_value = numbers.my_none?(Integer)
# p my_none_return_value

# # Script for checking my_count

# puts 'count - count the number of items in the numbers array'
# count_return_value = numbers.count
# p count_return_value

# puts 'my_count - count the number of items in the numbers array'
# my_count_return_value = numbers.my_count
# p my_count_return_value

# puts 'count - with argument given'
# count_return_value = [1, 3, 5, 3, 3].count(3)
# p count_return_value

# puts 'my_count - with argument given'
# my_count_return_value = [1, 3, 5, 3, 3].my_count(3)
# p my_count_return_value

# puts 'count - with block given'
# count_return_value = numbers.count { |number| (number % 2).zero?  }
# p count_return_value

# puts 'my_count - with block given'
# my_count_return_value = numbers.my_count { |number| (number % 2).zero? }
# p my_count_return_value

# # Script for checking my_map

# puts 'map - multiply numbers array by 2'
# map_return_value = numbers.map { |number| number * 2 }
# p map_return_value

# puts 'my_map - multiply numbers array by 2'
# my_map_return_value = numbers.my_map { |number| number * 2 }
# p my_map_return_value

# puts 'map - with no block'
# map_return_value = numbers.map
# p map_return_value

# puts 'my_map - with no block'
# my_map_return_value = numbers.my_map
# p my_map_return_value

# # Script for checking my_inject

puts 'inject - sum some numbers with a symbol argument'
inject_return_value = (5..10).inject(:+)
p inject_return_value

puts 'my_inject - sum some numbers with a symbol argument'
my_inject_return_value = (5..10).my_inject(:+)
p my_inject_return_value

puts 'inject - sum some numbers with a block'
inject_return_value = (5..10).inject { |sum, n| sum + n }
p inject_return_value

puts 'my_inject - sum some numbers with a block'
my_inject_return_value = (5..10).my_inject { |sum, n| sum + n }
p my_inject_return_value

puts 'inject - multiply some numbers with arguments'
inject_return_value = (5..10).inject(1, :*)
p inject_return_value

puts 'my_inject - multiply some numbers with arguments'
my_inject_return_value = (5..10).my_inject(1, :*)
p my_inject_return_value

puts 'inject - multiply some numbers with a block'
inject_return_value = (5..10).inject(1) { |product, n| product * n }
p inject_return_value

puts 'my_inject - multiply some numbers with a block'
my_inject_return_value = (5..10).my_inject(1) { |product, n| product * n }
p my_inject_return_value
