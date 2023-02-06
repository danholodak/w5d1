class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
      return true
    end
    return false
  end

  def remove(num)
    is_valid?(num)
    store[num] = false
  end

  def include?(num)
    if is_valid?(num)
      @store[num]
    end
  end

  private

  def is_valid?(num)
    if num < 0 || num > @max
      raise "Out of bounds"
    end
    return true
  end

  def validate!(num)
  end
end

class IntSet

  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
      self[num] << num
    end

  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    end

  end

  def include?(num)
    self[num].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    return store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num) && count < num_buckets
      self[num] << num
      @count += 1
    elsif !include?(num) && count >= num_buckets
      resize!
      self[num] << num
      @count += 1
    end   
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    return store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev = num_buckets
    store2 = Array.new(prev * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |int|
        i = int % store2.length 
        store2[i] << int
      end
    end
    @store = store2
  end
end
