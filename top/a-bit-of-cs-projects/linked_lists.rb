# frozen_string_literal: true

class LinkedList
  def initialize
    @head = nil
  end

  # Add a new node containing value to the end of the list.
  def append(value)
 
    # Store our starting spot on the list.
    current_node = @head
    
    # Go through the list until you get to the last item which will have a next
    #   of nil.
    until current_node.next == nil
      current_node = current_node.next
    end

    # Add the a new node as next for the current node.
    current_node.next = Node.new(value)
  end

  # Add a new node containing value to the start of the list.
  def prepend(value)
    # Get the current value for head so it can be made the next value for the
    # new Node object.
    old_head = @head

    # Store the new Node in head.
    @head = Node.new(value)

    # Set head's next_node to be the old 
    @head.next = old_head
  end

  # Return the total number of nodes in the list.
  def size
    # Store our starting spot on the list.

    # Initialize a counter to track the index we are at.

    # Go through the list until you get to the last item which will have a
    #   next of nil. Each time we advance increment the index counter.

    # Return the index counter once we have gotten to the end of the list.
  end

  # Return the first node in the list.
  def head

  end

  # Return the last node in the list.
  def tail

  end

  # Return the node at the given index.
  def at(index)

  end

  # Removes the last element from the list.
  def pop

  end

  # Returns true if the passed in value is in the list and otherwise returns
  #   false.
  def contains?(value)

  end

  # Returns the index of the node containing value, or nil if not found.
  def find(value)

  end

  # Represent LinkedList objects as strings so they can be printed to the
  #   console.
  #   ( value ) -> ( value ) -> ( value ) -> nil
  def to_s

  end
end

class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# Generate a new list.
my_list = LinkedList.new

# Prepend a Node to the empty list.
my_list.prepend(5)

# Prepend another node to the start of the list.
my_list.prepend(4)

# Prepend another node to the start of the list.
my_list.prepend(3)

# Append an item to the end of the list.
my_list.append(6)

# Append another item to the end of the list.
my_list.append(7)

p my_list
