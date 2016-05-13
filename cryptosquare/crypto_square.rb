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
    # alternative
    #Math.sqrt(normalize_plaintext.length).ceil
  end
  
  def plaintext_segments
    normalize_plaintext.split('').each_slice(size).map(&:join)
    # alternative
    # normalize_plaintext.scan(/.{1,#{size}}/)
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

# #20160507 live coding

# class Crypto
#   def initialize(text)
#     @normalized_plaintext = text.gsub(/[^a-zA-Z0-9]/, '').downcase
#   end

#   def normalize_plaintext
#     @normalized_plaintext
#   end

#   def size
#     plain_text_size = @normalized_plaintext.size
#     Math.sqrt(plain_text_size).ceil
#   end

#   def plaintext_segments
#     @normalized_plaintext.scan(/.{1,#{size}}/)
#   end

#   def ciphertext
#     encode_plaintext
#   end

#   def normalize_ciphertext
#     encode_plaintext(' ')
#   end

#   def encode_plaintext(delimiter='')
#     padded_segments = plaintext_segments.map { |string| right_pad(string, size) }
#     padded_segments.map(&:chars).transpose.map(&:join).map(&:strip).join(delimiter)
#   end

#   def right_pad(string, size_limit)
#     string + ' ' * (size_limit - string.size)
#   end
# end