class Crypto
  attr_reader :str
  
  def initialize(str)
    @str = str
  end
  
  def normalize_plaintext
    @normalize_text ||= str.downcase.gsub(/\W/, '')
  end
  
  def size
    num = (normalize_plaintext.length**0.5).to_i
    if num**2 < normalize_plaintext.length
      num += 1
    end
    num
  end
  
  def plaintext_segments
    normalize_plaintext.split('').each_slice(size).map(&:join)
  end
  
  def text_rectangle
    seg_array = plaintext_segments.map(&:chars)
    first_part, *remaining_part = *seg_array
    first_part.zip(*remaining_part)
  end
  
  def ciphertext
    text_rectangle.join
  end
  
  def normalize_ciphertext
    text_rectangle.map do |row|
      row.compact.join
    end.join(' ')
  end
    
end