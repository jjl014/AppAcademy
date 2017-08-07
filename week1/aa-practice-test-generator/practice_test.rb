class Array

  def my_zip(*arrs)
    res = []
    self.each_with_index do |el, idx|
      res << [el]
      arrs.each do |arr_other|
        res[idx] << arr_other[idx]
      end
    end
    res
  end

end

class Array

  def my_each(&prc)
    (0...self.length).each do |i|
      prc.call(self[i])
    end
    self
  end

  def my_each_with_index(&prc)
    (0...self.length).each do |i|
      prc.call(self[i], i)
    end
    self
  end

end

class Array

  def my_select(&prc)
    select = []
    self.each do |el|
      select << el if prc.call(el)
    end
    select
  end

end

class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    self.keys.each do |k|
      prc.call(k, self[k])
    end
  end

end

class Array

  def my_all?(&prc)
    self.each {|el| return false unless prc.call(el)}
    true
  end

end

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &blk)
    if accumulator
      self.each do |el|
        accumulator = blk.call(accumulator, el)
      end
    else
      accumulator = self.first
      self.drop(1).each do |el|
        accumulator =  blk.call(accumulator, el)
      end
    end
    accumulator
  end
end

# Write a method that doubles each element in an array
def doubler(array)
  array.map {|el| el*2}
end

class Array

  def my_any?(&prc)
    self.each {|el| return true if prc.call(el)}
    false
  end

end

class Array

  def my_reject(&prc)
    self - self.my_select(&prc)
  end

end
