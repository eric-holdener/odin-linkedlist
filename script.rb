require 'pry-byebug'
class LinkedList
  def initialize
    @head = Node.new('head')
  end

  # adds a new node containing value to end of list
  def append(value)
    node = @head
    while node.next_node != nil
      node = node.next_node
    end
    node.next_node = Node.new(value)
  end

  # adds a new node containing value to start of list
  def prepends(value)
    next_node = @head.next_node
    @head.next_node = Node.new(value, next_node)
  end

  # returns total number of nodes in the list
  # currently doesnt include head in the size, just nodes with data
  def size
    size = 0
    node = @head
    while node.next_node != nil
      size += 1
      node = node.next_node
    end
    size
  end

  # returns first node in the list
  def head
    return @head.next_node
  end

  # returns last node in the list
  def tail
    node = @head
    while node.next_node != nil
      node = node.next_node
    end
    node
  end

  # returns node at the given index
  # skips head / accessor node in indexing
  def at(index)
    idx = 0
    node = @head.next_node
    while node.next_node != nil
      if idx == index
        return node.data
      else
        node = node.next_node
        idx += 1
      end
    end
    if idx == index
      return node.data
    else
      return nil
    end
  end

  # removes the last element from the list
  def pop
    node = @head
    next_node = node.next_node
    while next_node.next_node != nil
      node = node.next_node
      next_node = node.next_node
    end
    node.next_node = nil
  end

  # returns true if the passed in value is in the list, otherwise returns false
  def contains?(value)
    node = @head
    while node.next_node != nil
      if node.data == value
        return true
      else
        node = node.next_node
      end
    end
    if node.data == value
      return true
    else
      false
    end
  end

  # returns the index of the node containing value, or nil if not found
  def find(value)
    index = 0
    node = @head
    while node.next_node != nil
      if node.data == value
        return index
      else
        index += 1
        node = node.next_node
      end
    end
    if node.data == value
      return index
    else
      return nil
    end
  end

  # represent LinkedList objects as strings, so you can print them out and preview in console
  # format is ( value ) -> ( value ) -> nil
  def to_s
    node = @head
    string = ""
    while node.next_node != nil
      string = string + " ( #{node.data} ) ->"
      node = node.next_node
    end
    string = string + " ( #{node.data} ) -> nil"
    puts string
  end

  # inserts a new node with value at index
  # index starts counting at first element, not at head
  def insert_at(value, index)
    idx = 0
    node = @head.next_node
    next_node = node.next_node
    while next_node != nil
      if idx === index - 1
        node.next_node = Node.new(value, next_node)
        return
      else
        node = next_node
        next_node = node.next_node
        idx += 1
      end
    end
    if idx == index
      node.next_node = Node.new(value, next_node)
    else
      puts 'That index is out of range'
    end
  end

  # removes node at given index
  # index starts counting at first element, not at head
  def remove_at(index)
    idx = 0
    node = @head.next_node
    next_node = node.next_node
    while next_node != nil
      if idx === index - 1
        node.next_node = next_node.next_node
        return
      else
        node = next_node
        next_node = node.next_node
        idx += 1
      end
    end
  end
end

class Node
  attr_accessor :data, :next_node
  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end
end

l_list = LinkedList.new
l_list.append('first entry')
l_list.append('second entry')
l_list.append('third entry')

l_list.prepends('new first entry')

l_list.insert_at('new second entry', 1)

l_list.to_s

p l_list.find('third entry')
p l_list.find('abcd')

p l_list.contains?('second entry')
p l_list.contains?('abcd')

p l_list.size

p l_list.tail

p l_list.at(1)

l_list.remove_at(1)

l_list.pop
l_list.to_s