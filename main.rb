require_relative "linked_list"

list = LinkedList.new

list.append("dog")
list.append("cat")
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")
list.prepend("rabbit")
list.insert("rabbit", 0)
list.remove(0)
puts list.at(3)
puts list.find("turtle")
puts list.pop

puts list
