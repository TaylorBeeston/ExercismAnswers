class Robot
  def self.generate_all_names
    [*'AA000'..'ZZ999'].shuffle
  end

  private_class_method :generate_all_names

  @@names = generate_all_names

  def initialize
  end

  def name
    @name ||= new_name
  end

  def self.forget
    @@names = generate_all_names
  end

  def reset
    @@names << @name
    new_name
  end

  private

    def new_name
      @name = @@names.shift
    end
end
