module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end

    self
  end

  def my_select
    selected_elements = []
    self.my_each do |element|
      selected_elements << element if yield(element)
    end

    selected_elements
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end

    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end

    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end

    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each { |element| count += 1 if yield(element) }
    else
      self.my_each { |element| count += 1 }
    end

    count
  end

  def my_map
    mapped_array = []
    if block_given?
      self.my_each { |element| mapped_array << yield(element) }
    end

    mapped_array
  end

  def my_inject(initial_value = 0)
    accumulator = initial_value

    self.my_each do |element|
      accumulator = yield(accumulator, element)
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |element|
      yield(element)
    end

    self
  end
end
