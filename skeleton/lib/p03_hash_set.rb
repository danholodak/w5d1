require_relative 'p02_hashing'
require_relative 'p01_int_set'

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    super
  end

  def include?(key)
    super
  end

  def remove(key)
    super
  end

  private

  def [](input)
    # optional but useful; return the bucket corresponding to `num`
    i = input.hash % num_buckets
    return @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
