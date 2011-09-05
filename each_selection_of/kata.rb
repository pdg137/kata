class EachSelectionEnumerable
  include Enumerable

  def initialize(array, n)
    @array = array
    @n = n
  end

  def each
    total = @array.reduce(0,:+)
    if total == @n
      yield @array
    elsif total < @n
      # nothing to do!
    elsif @n == 0
      yield @array.collect { 0 }
    else
      copy = @array.clone
      first_element = copy.shift

      if first_element < @n
        top = first_element
      else
        top = @n
      end

      (0..top).each do |i|
        # get all selections starting with 0
        copy.each_selection_of(@n-i).each do |selection|
          yield [i]+selection
        end
      end
    end
  end
end

class Array
  def each_selection_of(n)
    return EachSelectionEnumerable.new(self, n)
  end
end
