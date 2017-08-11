require 'benchmark'

class MinMaxStack
  def initialize
    @stack = []
    @max_stack = []
    @min_stack = []
  end

  def push(el)
    @stack << el
    @max_stack << el if @max_stack.empty? || el >= @max_stack.last
    @min_stack << el if @min_stack.empty? || el <= @min_stack.last
  end

  def pop
    popped_val = @stack.pop
    @max_stack.pop if @max_stack.last == popped_val
    @min_stack.pop if @min_stack.last == popped_val
    popped_val
  end

  def max
    @max_stack.last
  end

  def min
    @min_stack.last
  end

  def empty?
    @stack.empty?
  end

  def length
    @stack.length
  end

  def in_array
    @stack.dup
  end

  def last
    @stack.last
  end
end

class MinMaxStackQueue
  attr_reader :length
  def initialize
    @stack1 = MinMaxStack.new
    @stack2 = MinMaxStack.new
    @length = 0
  end

  def enqueue(el)
    @stack1.push(el)
    @length += 1
  end

  def dequeue
    if @stack2.empty?
      until @stack1.empty?
      pushed_value = @stack1.pop
        @stack2.push(pushed_value)
      end
    end
    @stack2.pop
    @length -= 1
  end

  def max
    return @stack1.max if @stack2.max.nil?
    return @stack2.max if @stack1.max.nil?
    [@stack1.max, @stack2.max].max
  end

  def min
    return @stack1.min if @stack2.min.nil?
    return @stack2.min if @stack1.min.nil?
    [@stack2.min, @stack1.min].min
  end

  def in_array
    arr = []
    stack1 = @stack1.in_array
    stack2 = @stack2.in_array
    until stack2.empty?
      arr << stack2.pop
    end
    arr + stack1
  end

end


def max_window_naive(arr, window)
  best_window = nil
  best_range = 0
  arr.each_cons(window) do |subset|
    range = subset.max - subset.min
    if range > best_range
      best_range = range
      best_window = subset
    end
  end
  best_window
end

def max_window_linear(arr, window)
  mmsq = MinMaxStackQueue.new
  window.times do |i|
    mmsq.enqueue(arr[i])
  end
  best_window = arr[0...window]
  best_range = mmsq.max - mmsq.min
  new_arr = arr.drop(window)
  until new_arr.empty?
    mmsq.dequeue
    mmsq.enqueue(new_arr.shift)
    range = mmsq.max - mmsq.min
    if range > best_range
      best_range = range
      best_window = mmsq.in_array
    end
  end
  best_range
end

if __FILE__ == $PROGRAM_NAME
  a1 = (0..10).to_a.shuffle
  a2 = (0..100).to_a.shuffle
  a3 = (0..1000).to_a.shuffle
  a4 = (0..10000).to_a.shuffle
  a5 = (0..100000).to_a.shuffle
  a6 = (0..1000000).to_a.shuffle
  a7 = (0..10000000).to_a.shuffle
  Benchmark.bm do |x|
    x.report("naive, 10 elements") {max_window_naive(a1,5)}
    x.report("linear, 10 elements") {max_window_linear(a1,5)}
    x.report("naive, 100 elements") {max_window_naive(a2,50)}
    x.report("linear, 100 elements") {max_window_linear(a2,50)}
    x.report("naive, 1000 elements") {max_window_naive(a3,500)}
    x.report("linear, 1000 elements") {max_window_linear(a3,500)}
    x.report("naive, 10000 elements") {max_window_naive(a4,5000)}
    x.report("linear, 10000 elements") {max_window_linear(a4,5000)}
    x.report("naive, 100000 elements") {max_window_naive(a5,50000)}
    x.report("linear, 100000 elements") {max_window_linear(a5,50000)}
    x.report("naive, 1000000 elements") {max_window_naive(a6,500000)}
    x.report("linear, 1000000 elements") {max_window_linear(a6,500000)}
    x.report("naive, 10000000 elements") {max_window_naive(a7,5000000)}
    x.report("linear, 10000000 elements") {max_window_linear(a7,5000000)}
  end
end

# user     system      total        real
# naive, 10 elements  0.000000   0.000000   0.000000 (  0.000041)
# linear, 10 elements  0.000000   0.000000   0.000000 (  0.000142)
# naive, 100 elements  0.000000   0.000000   0.000000 (  0.000438)
# linear, 100 elements  0.000000   0.000000   0.000000 (  0.000251)
# naive, 1000 elements  0.040000   0.000000   0.040000 (  0.034496)
# linear, 1000 elements  0.000000   0.000000   0.000000 (  0.001945)
# naive, 10000 elements  3.350000   0.070000   3.420000 (  3.437316)
# linear, 10000 elements  0.030000   0.010000   0.040000 (  0.030433)
# naive, 100000 elements321.420000   7.210000 328.630000 (329.258115)
# linear, 100000 elements  0.160000   0.010000   0.170000 (  0.175455)
#
