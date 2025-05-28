require_relative "linked_list"
require_relative "hash_map"

# list = LinkedList.new

# list.append("dog")
# list.append("cat")
# list.append("parrot")
# list.append("hamster")
# list.append("snake")
# list.append("turtle")
# list.prepend("rabbit")
# list.insert("rabbit", 0)
# list.remove(0)
# puts list.at(3)
# puts list.find("turtle")
# puts list.pop

# puts list

test = HashMap.new(0.5)

test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")

puts test.length
p test.keys
p test.values
p test.entries

puts test
