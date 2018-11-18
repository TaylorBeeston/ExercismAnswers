class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |letters| "#{letters.length}#{letters[0]}" }
  end

  def self.decode(input)
    input.gsub(/(\d+)(.)/) { $2 * $1.to_i }
  end
end
