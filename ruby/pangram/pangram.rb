class Pangram
  def self.pangram?(sentence)
    pangram = true
    for letter in 'a'..'z'
      pangram = false if sentence.downcase.count(letter) == 0
    end
    pangram
  end
end
