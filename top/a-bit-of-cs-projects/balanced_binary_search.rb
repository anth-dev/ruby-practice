# frozen_string_literal: true

require 'pry'

class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other_node)
    data <=> other_node.data
  end
end

class Tree
  def initialize(array)
    @root = build_tree(array)
  end

  # The build_tree method should return the level-1 root node.
  def build_tree(array)

    
    # Set the base case to stop recursion.
    return array.first if array.length == 1

    # Make sure the array is sorted and has no duplicates values.
    prepared_array = array.sort.uniq

    # Find the middle of the array.
    mid = (prepared_array.length - 1) / 2

    # Create a node with the middle element as root.
    node = Node.new(prepared_array[mid])

    # Recursively call build_tree method on all elements left of middle.
    node.left = Node.new(build_tree(prepared_array[0..mid - 1]))

    # Recursively call build_tree method on all elements right of middle.
    node.right = Node.new(build_tree(prepared_array[mid + 1..-1]))

    # Return root node.
    return node
  end

  # FIXME: The pretty print method isn't working correctly.
  def pretty_print(node = @root, prefix = '', is_left = true)

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# Testing comparable module.
first_node = Node.new(3)
second_node = Node.new(5)
p first_node < second_node
p first_node > second_node

# Testing Tree class.
test_tree_one = Tree.new([2, 1, 3])

p test_tree_one
pp test_tree_one