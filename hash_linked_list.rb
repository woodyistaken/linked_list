class HashLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
  end

  def append(key, value)
    node = KVNode.new(key, value)
    if @head.nil?
      @head = node
      @tail = node
      return
    end
    @tail.next = node
    @tail = node
  end

  def prepend(key, value)
    node = KVNode.new(key, value)
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
    curr_node = @head
    until curr_node.nil?
      sum += 1
      curr_node = curr_node.next
    end
    sum
  end

  def at(index)
    curr_node = @head
    index.times do
      curr_node = curr_node.next
    end
    curr_node
  end

  def pop
    return nil if @head.nil?

    if @head == @tail
      popped = @head
      @head = nil
      @tail = nil
      return popped
    end
    curr_node = @head
    curr_node = curr_node.next until curr_node.next.next.nil?
    popped = curr_node.next
    curr_node.next = nil
    @tail = curr_node
    popped
  end

  def contains?(key)
    curr_node = @head
    until curr_node.nil?
      return true if curr_node.key == key

      curr_node = curr_node.next
    end
    false
  end

  def find_node(key)
    curr_node = @head
    until curr_node.nil?
      return curr_node if curr_node.key == key

      curr_node = curr_node.next
    end
    nil
  end

  def find(key)
    index = 0
    curr_node = @head
    until curr_node.nil?
      return index if curr_node.key == key

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
    prev_node = at(index - 1)
    prev_node.next = prev_node.next.next
  end

  def remove_key(key)
    curr_node = @head
    until curr_node.nil?
      break curr_node if curr_node.key == key

      prev_node = curr_node
      curr_node = curr_node.next
    end
    return nil if curr_node.nil?

    if curr_node == @head

      @head = @head.next

      return
    end
    prev_node.next = prev_node.next.next
  end

  def each
    curr_node = head
    until curr_node.nil?
      yield(curr_node.key, curr_node.value)
      curr_node = curr_node.next
    end
  end

  def to_s
    str = ""
    curr_node = @head
    until curr_node.nil?
      str += "( #{curr_node} ) -> "
      curr_node = curr_node.next
    end
    str += "nil\n"
  end
end

class KVNode
  attr_accessor :key, :value, :next

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
  end

  def to_s
    @key + ":" + @value
  end
end
