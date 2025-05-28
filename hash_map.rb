require_relative "hash_linked_list"

class HashMap
  def initialize(load_factor = 0.8)
    @capacity = 16
    @load_factor = load_factor
    @entries = 0
    @hash_map = Array.new(@capacity) { HashLinkedList.new }
  end

  def hash(str)
    hash_code = 0
    prime_number = 31

    str.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def set(key, value)
    @entries += 1
    hash_key = hash(key) % @capacity
    linked_list = @hash_map[hash_key]
    data = linked_list.find_node(key)
    if data.nil?
      linked_list.append(key, value)
      check_load
      return
    end
    data.value = value

    check_load
  end

  def check_load
    grow_hash_map if @entries.to_f / @capacity.to_f >= @load_factor
  end

  def get(key)
    hash_key = hash(key) % @capacity
    linked_list = @hash_map[hash_key]
    data = linked_list.find_node(key)
    data.value
  end

  def has?(key)
    hash_key = hash(key) % @capacity
    linked_list = @hash_map[hash_key]
    data = linked_list.find_node(key)
    !data.nil?
  end

  def remove(key)
    hash_key = hash(key) % @capacity
    linked_list = @hash_map[hash_key]
    linked_list.remove_key(key)
  end

  def length
    @entries
  end

  def clear
    @capacity = 16
    @entries = 0
    @hash_map = Array.new(@capacity) { HashLinkedList.new }
  end

  def keys
    key_arr = []
    @hash_map.each do |linked_list|
      linked_list.each do |key, value|
        key_arr.push(key)
      end
    end
    key_arr
  end

  def values
    value_arr = []
    @hash_map.each do |linked_list|
      linked_list.each do |key, value|
        value_arr.push(value)
      end
    end
    value_arr
  end

  def entries
    entry_arr = []
    @hash_map.each do |linked_list|
      linked_list.each do |key, value|
        entry_arr.push([key, value])
      end
    end
    entry_arr
  end

  def grow_hash_map
    @capacity = 32
    @entries = 0
    old_hash_map = @hash_map
    @hash_map = Array.new(@capacity) { HashLinkedList.new }

    old_hash_map.each do |linked_list|
      value = linked_list.pop

      until value.nil?
        set(value.key, value.value)
        value = linked_list.pop
      end
    end
  end

  def to_s
    str = ""
    @hash_map.each_with_index do |linked_list, index|
      str += "#{index}:  "
      str += linked_list.to_s
    end
    str
  end
end
