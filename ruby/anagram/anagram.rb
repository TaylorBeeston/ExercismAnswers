class String
  # Returns whether a test word is an anagram of the current string
  def is_anagram_of?(word)
    original = self.downcase
    test = word.downcase
    match = true

    original.each_char { |letter| 
      match = false unless test.count(letter) == original.count(letter) }
    match = false if original == test

   match 
  end
end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_array)
    matches = []
    word_array.each { |word| matches << word if word.is_anagram_of?(@word) }
    matches
  end
end
