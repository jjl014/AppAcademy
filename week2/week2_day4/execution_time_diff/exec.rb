require 'benchmark'

def my_min1(list) # O(n^2)

  list.each do |el1|
    all_larger = true
    list.each do |el2|
      if el2 < el1
        all_larger = false
      end
    end
    return el1 if all_larger == true
  end
end

def my_min2(list) # O(n)
  min_found = list.first
  list.each do |el|
    min_found = el if el < min_found
  end
  min_found
end

def largest_cont_subsum(list) # naive O(n^3)
  subsums = []
  list.length.times do |i|
    list.each_cons(i+1) {|subset| subsums << subset.inject(&:+)}
  end
  subsums.max
end

def fast_subsum(list)
  best_sum, current_sum = 0,0
  list.each do |el|
    current_sum += el
    best_sum = current_sum if current_sum > best_sum
    current_sum = 0 if current_sum < 0
  end
  best_sum
end

def first_anagram?(string_1, string_2)
  perms = string_1.chars.permutation.to_a
  perms.include?(string_2.chars)
end

def second_anagram?(string_1, string_2)
  string_1, string_2 = string_1.dup, string_2.dup
  string_1.chars.each do |char|
    string_2.sub!(string_1[0],"")
    string_1 = string_1[1..-1]
  end
  string_1.empty? && string_2.empty?
end

def third_anagram?(string_1, string_2)
  string_1, string_2 = string_1.chars, string_2.chars
  string_1.sort == string_2.sort
end

def fourth_anagram?(string_1, string_2)
  hash = Hash.new(0)
  string_1.chars.each do |char|
    hash[char] += 1
  end
  string_2.chars.each do |char|
    hash[char] -= 1
  end
  hash.all? {|k,v| v == 0}
end

def bad_two_sum?(arr, target)
  arr.each.with_index do |el1, idx1|
    arr.each.with_index do |el2, idx2|
      next if idx1 == idx2
      return true if el1+el2 == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr = arr.sort
  arr.each_with_index do |el, idx|
    return true if (arr[0...idx] + arr[idx+1..-1]).bsearch {|x| x == target - el}
  end
  false
end

def good_two_sum?(arr,target)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end

  arr.each do |el|
    return true if target != 2*el && hash[target - el] > 0
    return true if hash[target - el] > 1
  end
  false
end

if __FILE__ == $PROGRAM_NAME
  a1 = (-10..10).to_a.shuffle
  a2 = (-100..100).to_a.shuffle
  a3 = (-1000..1000).to_a.shuffle
  a4 = (-10000..10000).to_a.shuffle
  a5 = (-100000..100000).to_a.shuffle
  a6 = (-1000000..1000000).to_a.shuffle

  Benchmark.bm(5) do |x|
    # x.report("bad subsum, 20 els") {largest_cont_subsum(a1)}
    # x.report("fast subsum, 20 els") {fast_subsum(a1)}
    # x.report("bad subsum, 200 els") {largest_cont_subsum(a2)}
    # x.report("fast subsum, 200 els") {fast_subsum(a2)}
    # x.report("bad subsum, 2000 els") {largest_cont_subsum(a3)}
    # x.report("fast subsum, 2000 els") {fast_subsum(a3)}
    # x.report("bad subsum, 20000 els") {largest_cont_subsum(a4)}
    # x.report("fast subsum, 20000 els") {fast_subsum(a4)}
    # x.report("bad subsum, 200000 els") {largest_cont_subsum(a5)}
    # x.report("fast subsum, 200000 els") {fast_subsum(a5)}
    # x.report("bad subsum, 2000000 els") {largest_cont_subsum(a6)}
    # x.report("fast subsum, 2000000 els") {fast_subsum(a6)}

    x.report("bad two sum 20 els") {bad_two_sum?(a1, 7)}
    x.report("okay two sum 20 els") {okay_two_sum?(a1, 7)}
    x.report("good two sum 20 els") {good_two_sum?(a1, 7)}
    x.report("bad two sum 200 els") {bad_two_sum?(a2, 70)}
    x.report("okay two sum 200 els") {okay_two_sum?(a2, 70)}
    x.report("good two sum 200 els") {good_two_sum?(a2, 70)}
    x.report("bad two sum 2000 els") {bad_two_sum?(a3, 700)}
    x.report("okay two sum 2000 els") {okay_two_sum?(a3, 700)}
    x.report("good two sum 2000 els") {good_two_sum?(a3, 700)}
    x.report("bad two sum 20000 els") {bad_two_sum?(a4, 7000)}
    x.report("okay two sum 20000 els") {okay_two_sum?(a4, 7000)}
    x.report("good two sum 20000 els") {good_two_sum?(a4, 7000)}
    x.report("bad two sum 200000 els") {bad_two_sum?(a5, 70000)}
    x.report("okay two sum 200000 els") {okay_two_sum?(a5, 70000)}
    x.report("good two sum 200000 els") {good_two_sum?(a5, 70000)}
    x.report("bad two sum 2000000 els") {bad_two_sum?(a6, 700000)}
    x.report("okay two sum 2000000 els") {okay_two_sum?(a6, 700000)}
    x.report("good two sum 2000000 els") {good_two_sum?(a6, 700000)}


  end
end
#
# user     system      total        real
# bad subsum, 20 els  0.000000   0.000000   0.000000 (  0.000469)
# fast subsum, 20 els  0.000000   0.000000   0.000000 (  0.000008)
# bad subsum, 200 els  0.150000   0.010000   0.160000 (  0.150990)
# fast subsum, 200 els  0.000000   0.000000   0.000000 (  0.000043)
# bad subsum, 2000 els111.380000   1.120000 112.500000 (112.908695)
# fast subsum, 2000 els  0.000000   0.000000   0.000000 (  0.000210)
