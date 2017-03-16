def find_ll_length(node)
  count = 0
  while node
    count += 1
    node = node.thing
  end
  return count
end

class Node
  attr_accessor :thing
  def initialize(thing=nil)
    self.thing = thing
  end
end

first_node = Node.new(Node.new(Node.new))
p find_ll_length(first_node)
