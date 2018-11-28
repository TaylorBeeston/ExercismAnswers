class Transpose
  def self.transpose(input)
    input.split("\n").map(&:chars).transpose.map(&:join).join("\n")
  end
end
