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

    # Make sure the array is sorted and has no duplicates values.

    # Find the middle of the array.

    # Make the middle element the root.

    # Recursively call build_tree method on all elements left of middle.

    # Recursively cass build_tree method on all elements right of middle.
  end
end

first_node = Node.new(3)
second_node = Node.new(5)

p first_node
p second_node

p first_node < second_node
p first_node > second_node

test_tree_class = Tree.new([1])