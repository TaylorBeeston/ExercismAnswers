class Scrabble

  # Strip word of all nonletter characters
  def initialize(word)
    @word = word.nil? ? '' : word.downcase.gsub(/[\s\d]/, '')
    @scores = create_lookup([["aeioulnrst", 1], ["dg", 2], ["bcmp", 3], ["fhvwy", 4],
            ["k", 5], ["jx", 8], ["qz", 10]]).freeze
  end

  # Returns scrabble score
  def score
    count_letters(@word).sum { |letter, count| @scores[letter] * count } 
  end

  # Convenient Scoring
  def self.score(word)
    Scrabble.new(word).score
  end

  private

    # Returns { x: 1, y: 1, z: 2 } from [["xy", 1]["z", 2]]
    def create_lookup(lookup_array)
      lookup_array.inject(Hash.new(0)) { |hash, pair|
            pair[0].each_char { |letter| hash[letter] = pair[1] }; hash }
    end

    # Returns a hash with the count of each letter
    def count_letters(word)
      word.scan(/\w/).inject(Hash.new(0)) { |h, c| h[c] += 1; h }
    end
end
