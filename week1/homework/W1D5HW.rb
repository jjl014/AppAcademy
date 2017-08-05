class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack.push(el)
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    index = @map.index {|el| el.first == key}
    if index
      @map[index] = [key, value]
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each {|el| return el.last if el.first == key}
    nil
  end

  def remove(key)
    @map.reject! {|el| el.first == key}
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
  end
end
