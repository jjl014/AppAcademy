require 'byebug'

def range(start, final)
  return [final] if start == final
  return [] if final < start
  #range(start, final-1) << final
  [start] + range(start + 1, final)
end

def sum_array_i(num_arr)
  num_arr.reduce(&:+)
end

def sum_array_r(num_arr)
  return num_arr[0] if num_arr.length <= 1
  num_arr.first + sum_array_r(num_arr[1..-1])
end

def exp1(base, pow)
  return 1 if pow == 0
  base * exp1(base, pow - 1)
end

def exp2(base, pow)
  return 1 if pow == 0
  if pow.even?
    exp2(base, pow/2) * exp2(base, pow/2)
  else
    base * (exp2(base, (pow - 1)/2) * exp2(base, (pow - 1)/2))
  end
end

def deep_dup(arr)
  return arr unless arr.is_a?(Array)
  return arr.dup unless arr.any? { |el| el.is_a?(Array) }
  hold = []
  arr.each do |el|
    hold << deep_dup(el)
  end
  hold
end

def fib_r(n)
  return [1,1].take(n) if n <= 2
  arr = fib_r(n-1) << fib_r(n-1)[-1] + fib_r(n-1)[-2]
  arr
end

def fib_i(n)
  fib = [1,1]
  return fib.take(n) if n <= 2
  until fib.length == n
    fib << fib[-1] + fib[-2]
  end
  fib
end

class Array
  def subsets
    return [[]] if self.empty?
    subs = self[0...-1].subsets
    subs + (subs.map { |el| el + [self.last]})
  end
end

def permutations(arr)
  return [arr] if arr.length == 1
  # debugger
  perms = []
  sub_perm = permutations(arr[1..-1])
  sub_perm.each do |perm|
    i = 0
    while i <= perm.length
      perms << perm[0...i] + [arr.first] + perm[i..-1]
      i+= 1
    end
  end
  perms
end

def bsearch(arr, targ)
  mid = arr.length / 2
  if arr[mid] == targ
    return mid
  elsif targ < arr[mid]
    bsearch(arr[0...mid], targ)
  else
    bsearch(arr[mid+1..-1], targ)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  debugger
  first_half = merge_sort(arr[0...arr.length/2])
  second_half = merge_sort(arr[arr.length/2..-1])
  merge(first_half, second_half)
end

def merge(arr1, arr2)
  i = 0
  j = 0
  result = []
  until result.length == (arr1.length + arr2.length)
    if arr1[i] <= arr2[j]
      result << arr1[i]
      i += 1 if (i + 1) < arr1.length
    else
      result << arr2[j]
      j += 1 if (j + 1) < arr2.length
    end
  end
  result
end
