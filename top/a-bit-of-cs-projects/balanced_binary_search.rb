# frozen_string_literal: true

class Node
  include Comparable
  attr :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other_Node)
    data <=> other_Node.data
  end
end

class Tree
  def initialize(array)
    @root = build_tree
  end
end

first_node = Node.new(3)
second_node = Node.new(5)

p first_node
p second_node

p first_node < second_node
p first_node > second_node
