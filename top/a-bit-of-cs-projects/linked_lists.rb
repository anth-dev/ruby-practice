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
    current_node = @head

    # Initialize a counter to track the number of Nodes we have went though.
    node_count = 1

    # Go through the list until you get to the last item which will have a
    #   next of nil. Each time we advance increment the index counter.
    until current_node.next == nil
      current_node = current_node.next
      node_count += 1
    end

    # Return the node_count.
    node_count
  end

  # Return the first node in the list.
  def head
    @head.value
  end

  # Return the last node in the list.
  def tail
    # Store our starting spot on the list.
    current_node = @head

    # Go through the list until we have a next of nil.
    until current_node.next == nil
      current_node = current_node.next
    end

    # Return the value of the final node.
    current_node.value
  end

  # Return the node at the given index.
  def at(index)
    # Store our starting spot on the list.
    current_node = @head

    # Initialize a counter to track the index we are on.
    current_index = 0

    # Go through the linked list until we get to the requested index.
    until current_index == index
      current_node = current_node.next
      current_index += 1
    end

    # Return the value at that index.
    current_node.value
  end

  # Removes the last element from the list.
  def pop!
    # Store out starting spot on the list.
    current_node = @head

    # Go through the list until we are at the second to last item.
    until current_node.next.next == nil
      current_node = current_node.next
    end

    # Store the value of the last item to return at the end of the method.
    removed_value = current_node.next.value
    
    # Change the next value to nil to make it the last item on the list.
    current_node.next = nil

    # Return the value that was removed from the list.
    removed_value
  end

  # Returns true if the passed in value is in the list and otherwise returns
  #   false.
  def contains?(value)
    # Use a variable to track if the value has been found or not.
    match = false

    # Store the starting spot on the list.
    current_node = @head

    # Go through the list checking the values for either a match or the end
    #   of the list.
    until current_node == nil
      match = true if current_node.value == value
      current_node = current_node.next
    end

    # Return the variable.
    match
  end

  # Returns the index of the node containing value, or nil if not found.
  def find(value)
    # Store our starting spot on the list.
    current_node = @head

    # Initialize a counter to track the index we are on.
    current_index = 0

    # Store the index where the value is found.
    index_of_value = nil

    # Go through the linked list incrementing current_index and checking for a
    #   value that matches the value passed to this method.
    until current_node == nil

      # Check to see if the current node's value matches the value passed to
      #   this method.
      index_of_value = current_index if current_node.value == value

      current_node = current_node.next
      current_index += 1
    end

    # Return index_of_value or 'nil'.
    index_of_value || 'nil'
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

# Return the size of the list.
puts "The list has #{my_list.size} nodes."

# Return the first node..
puts "The first node is #{my_list.head}."

# Return the last node.
puts "The last node is #{my_list.tail}."

# Return the node at the given index.
puts "The node at index 2 is #{my_list.at(2)}."

# Display list before removing last item with pop.
puts "The list before popping out the last item:"
p my_list

# Pop the last item out of the list.
puts "Removed #{my_list.pop!} from the list."

# The list after popping the last item.
puts "The list after popping out the last item:"
p my_list

# Check to see if 5 is contained in the list.
puts "Contains 5? #{my_list.contains?(5)}"

# Check to see if 10 is contained in the list.
puts "Contains 10? #{my_list.contains?(10)}"

# Check to see where/if 6 is in the list.
puts "6 is located at #{my_list.find(6)}"

# Check to see where/if 10 is in the list.
puts "10 is located at #{my_list.find(10)}"
