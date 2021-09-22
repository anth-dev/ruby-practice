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

  def my_all?
    return true unless block_given?

    false_or_nil_returned = false

    my_each do |element|
      block_return_value = yield(element)
      false_or_nil_returned = true if block_return_value.nil? || block_return_value == false
    end

    false_or_nil_returned == false
  end

  def my_any?
    return true unless block_given?

    true_returned = false
    my_each { |element| true_returned = true if yield(element) }
    true_returned
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

# Script for checking my_any?

puts 'any - check if numbers array contains any even numbers'
any_return_value = numbers.any? { |number| number.even? }
p any_return_value

puts 'my_any - check if numbers array contains any even numbers'
my_any_return_value = numbers.my_any? { |number| number.even? }
p my_any_return_value

puts 'any - check if [1, 3, 5] contains any even numbers'
any_return_value = [1, 3, 5].any? { |number| number.even? }
p any_return_value

puts 'my_any - check if [1, 3, 5] contains any even numbers'
my_any_return_value = [1, 3, 5].my_any? { |number| number.even? }
p my_any_return_value

puts 'any - returns true if no block is provided'
any_return_value = numbers.any?
p any_return_value

puts 'my_any - returns true when no block is provided'
my_any_return_value = numbers.any?
p my_any_return_value
