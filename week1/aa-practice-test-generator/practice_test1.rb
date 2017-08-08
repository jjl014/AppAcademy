require 'byebug'

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 1
  facs = factorials_rec(num -1)
  facs << facs.last * (num - 1)
end

# return b^n recursively. Your solution should accept negative values
# for n
def exponent(b, n)
  # debugger
  return 1 if n == 0
  if n > 0
    exp = exponent(b, n - 1)
    exp *= b
  else
    exp = exponent(b.to_f, n + 1)
    exp /= b
  end
  exp
end


# Write a recursive method that returns the sum of all elements in an array
def rec_sum(nums)
  return 0 if nums.empty?
  sum = rec_sum(nums.drop(1))
  sum += nums[0]
  sum
end

# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)
  arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
end

# Write a recursive method that takes in a base 10 number n and
# converts it to a base b number. Return the new number as a string
#
# E.g. base_converter(5, 2) == "101"
# base_converter(31, 16) == "1f"

def base_converter(num, b)
  return "" if num == 0
  digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  current = base_converter(num/b, b)
  current += digits[num % b]
end
# bc(52, 16)          bc(52, 2)
# bc(3, 16) + "4"     bc(26, 2) + "0"
# bc(0, 16) + "3"     bc(13, 2) + "0"
# "" + "3"            bc(6, 2) + "1"
# "3" + "4"           bc(3, 2) + "0"
# "34"                bc(1, 2) + "1"
#                     bc(0, 2) + "1"

# Implement a method that finds the sum of the first n
# fibonacci numbers recursively. Assume n > 0
def fibs_sum(n)
  return 0 if n == 0
  return 1 if n == 1
  prev_fibs = fibs_sum(n-1) + fibs_sum(n-2)
  prev_fibs += 1
end

# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)
  return true if key.length == 0
  next_key_char = key[0]
  key_index = string.index(next_key_char)

  return false if key_index.nil?
  string_include_key?(string[key_index+1..-1], key[1..-1])
end
# "cadbpc", "abc"
# "dbpc", "bc"
# "pc", "c"
# "", ""
# true


# make better change problem from class
# make_better_change(24, [10,7,1]) should return [10,7,7]
# make change with the fewest number of coins

# To make_better_change, we only take one coin at a time and
# never rule out denominations that we've already used.
# This allows each coin to be available each time we get a new remainder.
# By iterating over the denominations and continuing to search
# for the best change, we assure that we test for 'non-greedy' uses
# of each denomination.

# def make_better_change(value, coins)
#
# end

# return the sum of the first n even numbers recursively. Assume n > 0
def first_even_numbers_sum(n)
  # debugger
  return 2 if n == 1
  prev_sum = first_even_numbers_sum(n-1)
  prev_sum += 2 * n
end
# fens(3)
# fens(2)
# fens(1)
# 2
# 6
# 12


# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  while num > 10
    num = digital_root_step(num)
  end
  num
end

def digital_root_step(num)
  return num unless num > 10
  sum = 0
  until num == 0
    sum += num % 10
    num = num/10
  end
  sum
end

#returns all subsets of an array
def subsets(array)
  return [[]] if array.empty?
  subs = subsets(array[0..-2])
  subs.concat(subs.map {|el| el += [array.last]})
end
# subs([1,2,3])
# subs([1,2])
# subs([1])
# subs([])
# [[]]
# [[], [1]]
# [[], [1], [2], [1,2]]
# [[], [1], [2], [1,2], [3], [1,3], [2,3], [1,2,3]]

# Write a recursive function that returns the prime factorization of
# a given number. Assume num > 1
#
# prime_factorization(12) => [2,2,3]
def prime_factorization(num)
  return [] if num == 1
  (2..Math.sqrt(num).ceil).to_a.each do |i|
    if num % i == 0
      return [i] + prime_factorization(num/i)
    end
  end
  [num]
end

# pf(12)
# pf(6)
# pf(3)
# pf(1)
# [3] + []
# [2] + [3] + []
# [2] + [2] + [3] + []

# Write a recursive method that returns all of the permutations of an array
def permutations(array)
  return [array] if array.length == 1
  total_perms = []
  # first = array.shift
  # sub_perms = permutations(array)
  sub_perm = permutations(array[1..-1])
  sub_perm.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [array.first] + perm[i..-1]
    end
  end
  total_perms.sort
end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr.concat(el.my_flatten)
      else
        new_arr << el
      end
    end
    new_arr
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n < 1
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr += el.my_controlled_flatten(n - 1)
      else
        new_arr << el
      end
    end
    new_arr
  end
end

# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median
    return nil if self.empty?
    arr = self.sort
    midpt = self.length/2
    if self.length.odd?
      arr.sort[midpt]
    else
      (arr[midpt-1] + arr[midpt])/2.0
    end
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
    n += 1
  end
  primes
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  arr = []
  (1..num).each do |n|
    arr << n if num % n == 0
  end
  arr
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    res = []
    self.each_with_index do |n1, idx1|
      (idx1+1...self.length).each do |idx2|
        res << [idx1,idx2] if (n1 + self[idx2] == 0)
      end
    end
    res
  end
end

class Array

  def my_reverse
    arr = []
    self.each {|el| arr.unshift(el)}
    arr
  end

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups = Hash.new {|h,k| h[k] = []}
    self.each_with_index do |el, idx|
      dups[el] << idx if self.count(el) > 1
    end
    dups
  end
end

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)
    return nil if self.size == 0
    prc ||= Proc.new {|n1,n2| n1 <=> n2}
    midpt = self.length/2
    case prc.call(target, self[midpt])
    when -1
      self[0...midpt].my_bsearch(target, &prc)
    when 0
      midpt
    when 1
      search_res = self[midpt+1..-1].my_bsearch(target, &prc)
      search_res.nil? ? nil : (midpt + 1 + search_res)
    end
  end

end

class Hash

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    new_h = self.dup
    hash2.each do |k,v|
      new_h[k] = v
    end
    new_h
  end

end

class Array

  def my_join(str = "")
    joined = ""
    self.each_with_index do |el, idx|
      joined << el
      joined << str unless idx == self.length-1
    end
    joined
  end

end

class Array

  def my_rotate(num = 1)
    len = self.length
    self.drop(num % len) + self.take(num % len)
  end

end

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alphabet = ("a".."z").to_a
  str.chars.map do |ch|
    unless ch == " "
      alphabet[(alphabet.find_index(ch) + shift) % 26]
    else
      " "
    end
  end.join
end

# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  ignore = %w(a and of over the)
  words = title.split
  words.map.with_index do |w, idx|
    if ignore.include?(w) && idx != 0
      w
    else
      w.capitalize
    end
  end.join(" ")
end

# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def pig_latinify(sentence)
  sentence.split.map {|w| latinify(w)}.join(" ")
end

def latinify(word)
  vowels = %w(a e i o u)
  until vowels.include?(word[0])
    if word[0..1] == "qu"
      word = word[2..-1] + word[0..1]
    else
      word = word[1..-1] + word[0]
    end
  end
  word + "ay"
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    syms = []
    (0...self.length - 1).each do |start_pos|
      (start_pos+1...self.length).each do |end_pos|
        substr = self[start_pos..end_pos]
        syms << substr if substr == substr.reverse
      end
    end
    syms
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    substrs = self.substrings
    substrs.select {|word| dictionary.include?(word)}.uniq
  end

  def substrings
    arr = []
    self.length.downto(1).each do |i|
      self.chars.each_cons(i) {|sub| arr << sub.join}
    end
    arr
  end

end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new {|n1,n2| n1 <=> n2}
    swapped = true
    while swapped
      swapped = false
      (0...self.length-1).each do |i|
        if prc.call(self[i], self[i+1]) == 1
          swapped = true
          self[i], self[i+1] = self[i+1], self[i]
        end
      end
    end
    self
  end
# [1,2,3,4,5] len = 5
#
  def bubble_sort(&prc)
    arr = self.dup
    arr.bubble_sort!
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|n1,n2| n1 <=> n2}
    mid = self.length/2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    arr = []
    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        arr << left.shift
      when 0
        arr << left.shift
      when 1
        arr << right.shift
      end
    end
    arr.concat(left).concat(right)
  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet
    str.chars.sort_by {|ch| alphabet.index(ch)}.join
  else
    str.chars.sort.join
  end
end

class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new {|n1, n2| n1 <=> n2}
    return self if self.length < 2
    pivot = self.first
    left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
    right = self[1..-1].select{|el| prc.call(el, pivot) != -1}

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

end