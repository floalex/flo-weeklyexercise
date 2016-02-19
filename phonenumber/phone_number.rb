class PhoneNumber
  attr_reader :digits
  
  def initialize(digits)
    @digits = digits
  end
  
  def number
    if clean_digits.size == 10 && !letter
      number = clean_digits
    elsif (clean_digits.size == 11) && (clean_digits.start_with?('1'))
      number = clean_digits.slice(1..-1)
    else 
      number = '0000000000'
    end    
  end
  
  def area_code
    number[0,3] 
  end
  
  def to_s
    add_print = number.chars.unshift("(").insert(4, ") ").insert(-5, "-")
    add_print.join
  end
  
  private 
  
    def clean_digits
      digits.delete("()-. ")
    end
    
    def letter
      clean_digits.downcase.chars.any? { |c| c.between?('a', 'z') }
    end
  
end