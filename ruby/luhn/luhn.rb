class Luhn
  def self.valid?(number_string)
    stripped = strip(number_string)
    return false unless validate(stripped)
    divisible_by_ten?(luhn_transform(stripped).sum)
  end

  private

    # Removes all whitespace from an input string
    def self.strip(number_string)
      number_string.gsub(/\s/, '')
    end

    # Ensures that input contains only digits, and contains more than 2 digits
    def self.validate(input)
      !(input.length < 2 or input.match?(/\D/))
    end

    # Performs Step 1 of the Luhn Algorithm, doubling every second digit
    # starting from the right, then subtracting 9 from each doubled digit
    # if it becomes higher than 9 as a result of doubling
    def self.luhn_transform(number_string)
      number_string.reverse.chars.map.with_index do |num, index|
        num = num.to_i
        index.even? ? num : luhn_maths(num)
      end
    end

    def self.luhn_maths(num)
      num *= 2
      num > 9 ? num - 9 : num
    end

    def self.divisible_by_ten?(num)
      num % 10 == 0
    end
end
