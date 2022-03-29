class LinkedList
  def initialize
    @head = Node.new('head', nil)
  end

  # adds a new node containing value to end of list
  def append(value)
  end

  # adds a new node containing value to start of list
  def prepend(value)
  end

  # returns total number of nodes in the list
  def size
  end

  # returns first node in the list
  def head
  end

  # returns last node in the list
  def tail
  end

  # returns node at the given index
  def at(index)
  end

  # removes the last element from the list
  def pop
  end

  # returns true if the passed in value is in the list, otherwise returns false
  def contains?(value)
  end

  # returns the index of the node containing value, or nil if not found
  def find(value)
  end

  # represent LinkedList objects as strings, so you can print them out and preview in console
  # format is ( value ) -> ( value ) -> nil
  def to_s
  end

  # inserts a new node with value at index
  def insert_at(value, index)
  end

  # removes node at given index
  def remove_at(index)
  end
end

class Node
  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end
end