require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    if accumulator
      self.each do |el|
        accumulator = prc.call(accumulator, el)
      end
    else
      accumulator = self[0]
      self.drop(1).each do |el|
        accumulator = prc.call(accumulator, el)
      end
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).none? {|n| num % n == 0}
end

def primes(num)
  primes = []
  n = 2
  until primes.length == num
    primes << n if is_prime?(n)
    n+= 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  facts = factorials_rec(num - 1)
  facts << facts.last * (num - 1)
  facts
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups = Hash.new {|h,k| h[k] = []}
    self.each_with_index do |n, idx|
      dups[n] << idx if self.count(n) > 1
    end
    dups
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sym = []
    (0...self.length).each do |start_pos|
      ((start_pos+1)...self.length).each do |end_pos|
        substr = self[start_pos..end_pos]
        sym << substr if substr == substr.reverse
      end
    end
    sym
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|num1, num2| num1 <=> num2}
    mid = self.length/2
    left = self[0...mid].merge_sort(&prc)
    right = self[mid..self.length].merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end
end

def exp(b, n)
  return b if n == 1
  exp(b,n -1) * b
end

# exp(3,3)
# 3, 3
# 3, 2
# 3, 1
# 3
# 9
# 27
