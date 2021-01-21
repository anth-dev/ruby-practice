# frozen_string_literal: true

require 'pry'

class Node
  include Comparable
  # FIXME: Add accessors so left and right values can be set after each Node is
  #   created.
  attr :data, :left, :right

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
    # return nil if ...

    # Make sure the array is sorted and has no duplicates values.
    prepared_array = array.sort.uniq

    binding.pry

    # Find the middle of the array.

    # Make the middle element the root.

    # Recursively call build_tree method on all elements left of middle.

    # Recursively cass build_tree method on all elements right of middle.
  end

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

pp test_tree_one