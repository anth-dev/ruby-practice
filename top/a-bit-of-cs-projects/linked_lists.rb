# frozen_string_literal: true

class LinkedList
  def initialize
    @head = nil
  end

  # Add a new node containing value to the end of the list.
  def append(value)

  end

  # Add a new node containing value to the start of the list.
  def prepend(value)

  end

  # Return the total number of nodes in the list.
  def size

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
  def initialize
    @value = nil
    @next_node = nil
  end
end

