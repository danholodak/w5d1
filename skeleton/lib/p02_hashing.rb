class Integer
  # Integer#hash already implemented for you
end

class Array

  def hash
    if self.length == 0
      return 0.hash
    end
    hash_value = self[0].hash
    self[1...self.length].each_with_index do |int, i|
      hash_value = hash_value ^ (int+i).hash
    end
    hash_value
  end
end

class String
  def hash
    split_string = self.split("")
    split_string = split_string.map.with_index{|ele, i| (ele.ord + i ).hash}
    return split_string.inject{|acc,el| acc ^ el}


    # hash_value = self[0].to_i.hash
    # self[1...self.length].each_char.with_index do |char, i|
    #   hash_value = hash_value ^ (i + char.to_i).hash
    # end
    # hash_value

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = []
    self.each do |key, value|
      array << key.to_s.ord
      array << value.ord
    end
    array.sort!.hash
  end
end
