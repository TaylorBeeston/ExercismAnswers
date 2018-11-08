class Bob
  def self.hey(remark)
    remark.strip!
    return "Fine. Be that way!" if remark.empty?

    q = remark.end_with?('?')
    yelling = remark.match?(/[a-zA-z]/) && (remark == remark.upcase)
    

    if q
      yelling ? "Calm down, I know what I'm doing!" : "Sure."
    else
      yelling ? "Whoa, chill out!" : "Whatever."
    end

  end
end
