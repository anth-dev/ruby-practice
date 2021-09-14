# frozen_string_literal: true
require 'pry'

module Enumerable
  def my_each
    return Enumerator.new(self) unless block_given?

    copy_of_array = self.dup
    i = 0
    until i == self.length do
      yield copy_of_array.shift
      i += 1
    end
    self
  end

  def my_each_with_index
    return Enumerator.new(self) unless block_given?

    copy_of_array = self.dup
    i = 0
    until i == self.length do
      yield(copy_of_array.shift, i)
      i += 1
    end
    self
  end

  def my_select

  end
end

numbers = [1, 2, 3, 4, 5]

# Script for checking my_each

puts "my_each - puts each item"
numbers.my_each { |item| puts item }

puts "each - puts each item"
numbers.each { |item| puts item }

puts "my_each_return_value with_block"
my_each_return_value = numbers.my_each { |x| 'I am in a block!' }
p my_each_return_value

puts "each return value with block"
each_return_value = numbers.each { |x| 'I am also in a block!' }
p each_return_value

puts "my_each return value without block"
my_each_return_value = numbers.my_each
p my_each_return_value

puts "each return value without block"
each_return_value = numbers.each
p each_return_value

# Script for checking my_each_with_index

puts "each_with_index - puts each item and it's index"
numbers.each_with_index { |item, index| puts "#{index}: #{item}" }

puts "my_each_with_index - puts each item and it's index"
numbers.my_each_with_index { |item, index| puts "#{index}: #{item}" }

puts "each_with_index return value with block"
each_with_index_return_value = numbers.each_with_index { |item, index| 'I am in the block'}
p each_with_index_return_value

puts "my_each_with_index return value with block"
my_each_with_index_return_value = numbers.my_each_with_index { |item, index| 'I am in the block'}
p my_each_with_index_return_value

puts "each_with_index return value without block"
each_with_index_return_value = numbers.each_with_index
p each_with_index_return_value

puts "my_each_with_index return value without block"
my_each_with_index_return_value = numbers.my_each_with_index
p my_each_with_index_return_value
