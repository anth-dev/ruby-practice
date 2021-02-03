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

  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  # The build_tree method should return the level-1 root node.
  def build_tree(array, right = false)

    # Make sure the array is sorted and has no duplicates values.
    prepared_array = array.sort.uniq

    # Check if we are down to two elements yet.
    if prepared_array.length == 2
      
      if right

        # Make the lesser number into a node.
        node = Node.new(prepared_array.first)

        # Set the created node's right value to be a new node of the greater
        #   number.
        node.right = Node.new(prepared_array.last)

      else

        # Make the greater number into a node.
        node = Node.new(prepared_array.last)

        # Set the created node's left value to be a new node of the lesser
        #   number.
        node.left = Node.new(prepared_array.first)

      end

    else

      # Find the middle of the array.
      mid = (prepared_array.length - 1) / 2

      # Create a node with the middle element as root.
      node = Node.new(prepared_array[mid])

      # If we only have the one item, return the node now.
      return node if prepared_array.length == 1

      # Recursively call build_tree method on all elements left of middle.
      node.left = build_tree(prepared_array[0..mid - 1])

      # Recursively call build_tree method on all elements right of middle.
      node.right = build_tree(prepared_array[mid + 1..-1], true)

    end

    # Return root node.
    return node
  end

  def insertNode(root, key)

    # Base cases??
    #    Get to a leaf node and make a new node containing the key.
    if root.nil?
      return Node.new(key)

    # Compare the key to the data attribute of root.
    else
      if root.data == key
        return root

      # If the key is smaller than root, recursivly call this method on the left
      #    subtree of root passing along the key we want to insert.
      elsif root.data < key
        root.right = insertNode(root.right, key)

      # Else, recursively call this method on the right subtree of root passing
      #    along the key we want to insert.
      else
        root.left = insertNode(root.left, key)
      end
    end

    return root
  end

  # FIXME: deleteNode isn't working properly when the root node is being
  #   deleted. Try with other nodes with two children.
  def deleteNode(root, key)
    # Base case: Return root if root is nil
    return root if root.nil?

    # Compare root's data value to with the key looking to be deleted to
    #   determine where to look for it.
    if key < root.data
      root.left = deleteNode(root.left, key)

    elsif key > root.data
      root.right = deleteNode(root.right, key)


    # If root's key matches the key to be deleted account for
    #   one or less children and cases where it has two children.
    else

      # Node has one or less children.
      if root.left.nil?
        temp = root.right
        root = nil
        return temp

      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp

      # Node has two children.

      # Get inorder successor.
      temp = minValueNode(root.right)

      # Copy the inorder successor's content to the current node.
      root.data = temp.data

      # Delete the inorder successor.
      root.right = deleteNode(root.right, temp.data)
      end
    end

    return root
  end

  def minValueNode(node)
    current = node

    # Loop down through the tree to find the leftmost leaf.
    while current.left.nil? == false
      current = current.left
    end

    return current
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
test_tree_one = Tree.new([1, 2, 3, 4, 5])
p test_tree_one
test_tree_one.pretty_print

test_tree_two = Tree.new([1, 2, 3])
p test_tree_two
test_tree_two.pretty_print

# Test insert method.
test_tree_three = Tree.new([3, 7, 9, 10, 13])
test_tree_three.pretty_print
test_tree_three.insertNode(test_tree_three.root, 11)
test_tree_three.pretty_print

# Test delete method.
test_tree_three.deleteNode(test_tree_three.root, 11)
test_tree_three.pretty_print
