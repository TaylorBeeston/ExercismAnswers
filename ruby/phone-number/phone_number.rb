class PhoneNumber
  def self.clean(num)
    sanitized_number = num.strip.gsub(/[^\d]/, "").delete_prefix("1")
    bad = sanitized_number.length != 10 || sanitized_number[0].to_i < 2 || 
          sanitized_number[3].to_i < 2
    bad ? nil : sanitized_number
  end
end
