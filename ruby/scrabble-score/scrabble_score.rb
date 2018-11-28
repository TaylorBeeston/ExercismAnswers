class Scrabble
  SCORES = [["aeioulnrst", 1], ["dg", 2], ["bcmp", 3], ["fhvwy", 4],
            ["k", 5], ["jx", 8], ["qz", 10]]

  # Strip word of all nonletter characters
  def initialize(word)
    @word = word.nil? ? '' : word.downcase.gsub(/[\s\d]/, '')
  end

  # Returns scrabble score
  def score
    @word.chars.sum { |letter| score_of(letter) }
  end

  # Convenient Scoring
  def self.score(word)
    Scrabble.new(word).score
  end

  private

    # Looks up and memoizes the score of a given letter into @scores
    def score_of(letter)
      @scores ||= Hash.new { |h, letter| 
        h[letter] = SCORES.detect { |letters, score| 
          letters.include?(letter) }[1] }
      @scores[letter]
    end
end
