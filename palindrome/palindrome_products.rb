class PalindromeProduct
  attr_accessor :value, :factors
  
  def initialize
    @factors = []
  end
end

class Palindromes
  attr_accessor :palindromes
  
  def initialize(options)
    min = options[:min_factor] || 1
    max = options[:max_factor]
    @range = (min..max)
  end

  def generate
    @palindromes = {} #@palindromes = { 9009 => PalindromeProduct(value: 9009, factors: [[91, 99]])
    @range.each do |num1|
      @range.each do |num2|
        product = num1 * num2
        if palindrome?(product)
          pali_product = @palindromes[product] || PalindromeProduct.new
          pali_product.value = product
          pali_product.factors << [num1, num2].sort
          pali_product.factors.uniq!
          
          @palindromes[product] = pali_product
        end
      end
    end
  end
  
  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
  
  def largest
    @palindromes[@palindromes.keys.max]
  end
  
  def smallest
    @palindromes[@palindromes.keys.min]
  end
end