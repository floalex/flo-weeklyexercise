class Series
  def initialize(string)
    @string = string.split('').map(&:to_i)
  end
  
  def slices(length)
    raise ArgumentError if length > @string.size
    result = []
    @string.each_cons(length).each do |group| 
      result << group
    end
    result
  end
end
