class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length

    distance = 0
    strand1.each_char.with_index { |char1, index|
      distance += 1 unless char1 == strand2[index] }
    distance
  end
end
