class Phrase
  def initialize(words)
    @words = words.strip.downcase.scan(/\w+(?:'\w+)?/)
  end

  def word_count
    counts = Hash.new(0)
    @words.each { |word| counts[word] += 1 }
    counts
  end
end
