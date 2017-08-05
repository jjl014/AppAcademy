# pay attention to to eq specs
# pay attention to error messages

class Array

end

def is_prime?(num)
  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
  # (2...num).none? {|factor| num % factor == 0}
end

def primes(num)
  primes = []
  i = 2
  until primes.length == num
    primes << i if is_prime?(i)
    i += 1
  end
  primes
end

def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

# Write an Array#dups method that will return a hash containing the indices of all
# duplicate elements. The keys are the duplicate elements; the values are
# arrays of their indices in ascending order, e.g.
# [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

class Array
  def dups
    positions = Hash.new { |h,k| h[k] = [] }
    self.each_with_index do |item, idx|
      positions[item] << idx
    end
    positions.select {|k,v| val.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  # appacademy
  # 0 a) ap, app, appa, appac...
  # 1 p) pp, ppa, ppac...
  # 2 p) pa, pac...

  def symmetric_substrings
    sym_subs = []
    length.times do |start_pos|
      ((start_pos + 1)...length).each do |end_pos|
        substring = self[start_pos..end_pos]
        symm_subs << substring if substring == substring.reverse
    end
    sym_subs
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y}
    #base case
    return self if length <= 1
    midpt = self.length/2
    # left = self.take(midpt).merge_sort(&prc)
    # right = self.drop(midpt).merge_sort(&prc)
    left = self.take(midpt)
    right = self.drop(midpt)
    # sort left and right halves and merge
    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
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
    merged #don't really need this but makes it clearer on what we're returning
  end
end
