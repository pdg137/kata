class EachSelectionEnumerable
  include Enumerable

  def initialize(array,n)
    raise "called with #{n}" if n < 0

    @array = array
    @n = n
  end

  def each
    total = @array.reduce(0,:+)
    if @n == 0
      yield @array.collect { 0 } # all zeros is the only possibility
    elsif total == @n
      yield @array # this is the only possibility
    elsif @n > total
      return # there are no possibilities
    else
      # make a copy with the first element removed
      copy = @array.clone
      first_element = copy.shift

      (0..first_element).each do |i|
        # try putting i in the first element of the result
        if @n >= i
          copy.each_selection_of(@n-i) do |selection|
            yield [i] + selection
          end
        end
      end
    end
  end
end

class Array
  def each_selection_of(n)
    e = EachSelectionEnumerable.new(self,n)
    if block_given?
      e.each { |x| yield x}
    else
      e
    end
  end
end
