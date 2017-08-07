class Array

  def my_zip(*arrs)
    result = []
    (0...size).each do |idx|
      result << [self[idx]]
      arrs.each do |arr|
        result[idx] << arr[idx]
      end
    end

    result
  end

end

class Array

  def my_each(&prc)
    (0...size).each do |i|
      prc.call(self[i])
    end

    self
  end

  def my_each_with_index(&prc)
    (0...size).each do |idx|
      prc.call(self[idx], idx)
    end

    self
  end
end

class Array

  def my_select(&prc)
    select = []

    self.my_each{|el| select << el if prc.call(el)}
    select
  end

end

class Hash

  def my_each(&prc)
    keys.each do |k|
      prc.call(k, self[k])
    end
  end

end

class Array

  def my_all?(&prc)
    my_each{|el| return false unless prc.call(el)}
    true
  end

end

class Array
  def my_inject(accumulator = nil, &block)
    i = 0

    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end

def doubler(array)
  array.map { |num| num * 2 }
end

class Array

  def my_any?(&prc)
    my_each{|el| return true if prc.call(el)}
    false
  end

end

class Array

  def my_reject(&prc)
    self.dup - my_select(&prc)
  end

end

