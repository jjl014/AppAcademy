require 'byebug'

class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    prc ||= Proc.new {|n1, n2| n1 <=> n2}
    return self if self.length <= 1
    mid = self.length/2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    res =[]
    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        res << left.shift
      when 0
        res << left.shift
      when 1
        res << right.shift
      end
    end
    res.concat(left).concat(right)
  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    res = []
    (0...self.length-1).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        res << [idx1,idx2] if (self[idx1] + self[idx2]) == target
      end
    end
    res
  end
end

# Write a method that recursively finds the first `n` factorial numbers
# and returns them. N! is the product of the numbers 1 to N.
# Be aware that the first factorial number is 0!, which is defined
# to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  return [1] if num <= 1
  prev_facs = factorials_rec(num - 1)
  prev_facs << prev_facs.last * (num - 1)
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    words1 = self.split
    words2 = other.split
    if words1.all? {|w| words2.include?(w)} &&
        words2.all? {|w| words1.include?(w)} &&
        words1.length == words2.length
      return true
    else
      false
    end
  end
end

def is_prime?(num)
  (2...num).none? {|n| num % n == 0}
end

# Write a method that returns the nth prime number
def nth_prime(n)
  i = 2
  res = nil
  until n == 0
    if is_prime?(i)
      res = i
      n -= 1
    end
    i += 1
  end
  res
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    (self.length).times do |i|
      prc.call(self[i])
    end
    self
  end
end

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(accumulator = nil, &prc)
    if accumulator
      self.each do |el|
        accumulator = prc.call(accumulator, el)
      end
    else
      accumulator = self.first
      self.drop(1).each do |el|
        accumulator = prc.call(accumulator, el)
      end
    end
    accumulator
  end
end
