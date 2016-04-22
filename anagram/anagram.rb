class Anagram
  attr_reader :word
  
  def initialize(word)
    @word = word
  end
  
  def match(sublists)
    sublists.select { |sublist| anagram_of?(sublist) }
  end
  
  def anagram_of?(other_word)
    !same_word?(other_word) && word.downcase.chars.sort == other_word.downcase.chars.sort
  end

  def same_word?(other_word)
    word.downcase == other_word.downcase
  end
end