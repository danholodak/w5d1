

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    old_parent = self.prev
    old_child = self.next
    old_parent.next = old_child
    old_child.prev = old_parent

  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new()
    @head.prev = nil
    @tail = Node.new()
    @tail.prev = @head
    @head.next = @tail
    @tail.next = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if !self.empty?
      return @head.next.value
    end
  end

  def last
    if !self.empty?
      return @tail.prev.value
    end
  end

  def empty?
    if @head.next == @tail
      return true
    end
    false
  end

  def get(key)
    self[key].value 
  end

  def include?(key)
  end

  def append(key, val)
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    i = 0
    current_node = @head
    until current_node == @tail
       if current_node == @head
        current_node = current_node.next
       end
    
      yield(current_node)
      # prc.call(current_node, i)
      current_node = current_node.next
      i += 1
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
