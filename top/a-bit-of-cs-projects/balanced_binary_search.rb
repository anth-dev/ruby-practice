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

  def insert_node(root, key)

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
        root.right = insert_node(root.right, key)

      # Else, recursively call this method on the right subtree of root passing
      #    along the key we want to insert.
      else
        root.left = insert_node(root.left, key)
      end
    end

    return root
  end

  def delete_node(root, key)
    # Base case: Return root if root is nil
    return root if root.nil?

    # Compare root's data value to with the key looking to be deleted to
    #   determine where to look for it.
    if key < root.data
      root.left = delete_node(root.left, key)

    elsif key > root.data
      root.right = delete_node(root.right, key)


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
      end

      # Node has two children.

      # Get inorder successor.
      temp = min_value_node(root.right)

      # Copy the inorder successor's content to the current node.
      root.data = temp.data

      # Delete the inorder successor.
      root.right = delete_node(root.right, temp.data)
    end

    return root
  end

  def min_value_node(node)
    current = node

    # Loop down through the tree to find the leftmost leaf.
    while current.left.nil? == false
      current = current.left
    end

    return current
  end

  def find(root, key)
    # Base case: Root is nil or it's data matches the key.
    return root if root.nil? || root.data == key

    # Key is greater than root's key.
    return find(root.right, key) if root.data < key

    # Key is smaller than root's key.
    return find(root.left, key)

  end

  def level_order(node)

    return if node.nil?

    recorded_data = []
    queue = []
    queue.push(node)

    until queue.empty? do
      current = queue.first
      recorded_data.push(current.data)
      queue.push(current.left) if current.left.nil? == false
      queue.push(current.right) if current.right.nil? == false
      queue.shift
    end
    
    recorded_data
  end

  def inorder(root, recorded_data = [])
    return if root.nil?

    inorder(root.left, recorded_data)
    recorded_data.push(root.data)
    inorder(root.right, recorded_data)

    recorded_data
  end

  def preorder(root, recorded_data = [])
    return if root.nil?

    recorded_data.push(root.data)
    preorder(root.left, recorded_data)
    preorder(root.right, recorded_data)

    recorded_data
  end

  def postorder(root, recorded_data = [])
    return if root.nil?

    postorder(root.left, recorded_data)
    postorder(root.right, recorded_data)
    recorded_data.push(root.data)

    recorded_data
  end

  def height(root)
    return -1 if root.nil?

    left_height = height(root.left)
    right_height = height(root.right)

    left_height > right_height ? left_height + 1 : right_height + 1
  end

  def depth(node)

    current_depth = 0
    current_node = root

    # If the node matches the root node, return the root node.
    return current_depth if node == root

    # Until node matches current.node go deeper left or right until the node is
    #   located.
    until node == current_node do
      if node.data < current_node.data
        current_node = current_node.left
      else
        current_node = current_node.right
      end
      current_depth += 1
    end

    current_depth
  end

  def balanced?
    left_height = height(root.left)
    right_height = height(root.right)

    if left_height <= right_height
      difference = right_height - left_height
    else
      difference = left_height - right_height
    end
    
    difference <= 1
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
test_tree_three = Tree.new([1, 3, 7, 9, 10, 13, 25, 60, 120, 365])
test_tree_three.pretty_print
test_tree_three.insert_node(test_tree_three.root, 11)
test_tree_three.pretty_print

# Test delete method.
test_tree_three.delete_node(test_tree_three.root, 11)
test_tree_three.pretty_print

# Test the find method.
p test_tree_three.find(test_tree_three.root, 13)

# Test the level_order method.
p test_tree_three.level_order(test_tree_three.root)

# Test the inorder method.
p test_tree_three.inorder(test_tree_three.root)

# Test the preorder method.
p test_tree_three.preorder(test_tree_three.root)

# Test the postorder method.
p test_tree_three.postorder(test_tree_three.root)

# Test the height method.
p test_tree_three.height(test_tree_three.root)

# Test the depth method.
p test_tree_three.depth(test_tree_three.find(test_tree_three.root, 120))

# Test the balanced? method.
p test_tree_three.balanced?
test_tree_three.insert_node(test_tree_three.root, 400)
test_tree_three.insert_node(test_tree_three.root, 500)
test_tree_three.insert_node(test_tree_three.root, 600)
test_tree_three.pretty_print
p test_tree_three.balanced?