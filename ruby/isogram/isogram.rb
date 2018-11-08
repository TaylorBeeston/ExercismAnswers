class Isogram
  def self.isogram?(phrase)
    arrayed = phrase.upcase.gsub(/[\s-]/, "").chars
    arrayed == arrayed.uniq
  end
end
