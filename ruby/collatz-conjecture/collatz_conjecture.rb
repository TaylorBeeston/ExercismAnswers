class CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n <= 0
    step_count = 0
    while n != 1
      if n % 2 == 0
        n /= 2
      else
        n *= 3
        n += 1
      end
      step_count += 1
    end
    step_count
  end
end
