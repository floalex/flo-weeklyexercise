module PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0
    
    return 'deficient' if is_odd?(num) || sum_factors(num) < num
    return 'perfect' if sum_factors(num) == num
    return 'abundant' if sum_factors(num) > num
  end
  
  def self.is_odd?(num)
    num % 2 != 0
  end
  
  def self.sum_factors(num)
    factors = []
    (1..num/2).each do |element|
      factors << element if num % element == 0
    end
    factors.reduce(:+)
  end
end

# edge cases:
# puts PerfectNumber.classify(1) #=> 'deficient'