# class DNA
#   attr_reader :strand
  
#   def initialize(strand)
#     @strand = strand
#   end
  
#   def hamming_distance(distance)
#     return 0 if strand == distance
    
#     sum = 0
#     index = 0
#     smaller = [strand.size, distance.size].min
    
#     while index <= smaller - 1
#       sum += 1 if strand[index] != distance[index]
#       index += 1
#     end
  
#     sum
#   end
# end

#20160514 live recording
class DNA
  def initialize(original_strand)
    @original_strand = original_strand
  end
  
  def hamming_distance(test_strand)
    effective_length = [@original_strand.size, test_strand.size].min
    distance = 0
    (0..(effective_length-1)).each do |index|
      distance += 1 if @original_strand[index] != test_strand[index]
    end
    distance
  end
end

# multiple collections

# exercise: build a method that will return the greatest common divider of two positive integers

def gcd(a, b)
  minimum = [a, b].min
  minimum.downto(1) do |divisor|
    return devisor if a % divisor == 0 && b % divisor == 0
  end
  
  # alternative
  divisor = [a, b].min
  while divisor > 0
    return devisor if a % divisor == 0 && b % divisor == 0
    divisor -= 1
  end
end

gcd(9, 15) #=> 3
gcd(100, 11) #=> 1
gcd(14, 28) # => 14