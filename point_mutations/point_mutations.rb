class DNA
  attr_reader :strand
  
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(distance)
    return 0 if strand == distance
    
    sum = 0
    index = 0
    smaller = [strand.size, distance.size].min
    
    while index <= smaller - 1
      sum += 1 if strand[index] != distance[index]
      index += 1
    end
  
    sum
  end
end