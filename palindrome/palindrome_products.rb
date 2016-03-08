PalindromeProduct = Struct.new(:value, :factors)

class Palindromes
  attr_accessor :palindromes
  
  def initialize(options)
    min = options[:min_factor] || 1
    max = options[:max_factor]
    @range = (min..max)
  end

  def generate
    @palindromes = Hash.new { |hash, key| hash[key] = [] }  #@palindromes = { 9009 =>  [[91, 99]])
    @range.to_a.repeated_combination(2) do |num1, num2|
      product = num1 * num2
      if palindrome?(product)
        @palindromes[product] << [num1, num2]
      end
    end
  end
  
  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
  
  def largest
    PalindromeProduct.new(largest_product, @palindromes[largest_product])
  end
  
  def smallest
    PalindromeProduct.new(smallest_product, @palindromes[smallest_product])
  end
  
  def smallest_product
    @palindromes.keys.min
  end

  def largest_product
    @palindromes.keys.max
  end
end