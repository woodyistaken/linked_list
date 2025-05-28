class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
      return
    end
    @tail.next = node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
      return
    end
    node.next = @head
    @head = node
  end

  def size
    sum = 0
    curr_node = head
    until curr_node.nil?
      sum += 1
      curr_node = curr_node.next
    end
  end

  def at(index)
    curr_node = head
    index.times do
      curr_node = curr_node.next
    end
    curr_node
  end

  def pop
    return nil if @head.nil?

    curr_node = head
    curr_node = curr_node.next until curr_node.next.next.nil?
    popped = curr_node.next
    curr_node.next = nil
    @tail = curr_node
    popped
  end

  def contains?(value)
    curr_node = head
    until curr_node.nil?
      return true if curr_node.data == value

      curr_node = curr_node.next
    end
    false
  end

  def find(value)
    index = 0
    curr_node = head
    until curr_node.nil?
      return index if curr_node.data == value

      index += 1
      curr_node = curr_node.next
    end
    nil
  end

  def insert(value, index)
    node = Node.new(value)
    if index == 0
      node.next = @head
      @head = node
      return
    end
    curr_node = at(index - 1)
    next_node = curr_node.next
    curr_node.next = node
    node.next = next_node
  end

  def remove(index)
    if index == 0
      @head = @head.next
      return
    end
    curr_node = at(index - 1)
    curr_node.next = curr_node.next.next
  end

  def to_s
    curr_node = head
    until curr_node.nil?
      print "( #{curr_node.data} ) -> "
      curr_node = curr_node.next
    end
    puts "nil"
  end
end

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end

  def to_s
    @data
  end
end
