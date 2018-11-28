class Clock
  def initialize(time_hash)
    @hour = init_hour(time_hash[:hour])
    @minute = init_minute(time_hash[:minute])
  end

  def to_s
    "#{justify(@hour)}:#{justify(@minute)}"
  end

  def to_i
    (@hour * 60) + @minute
  end

  def +(other_clock)
    set(self.to_i + other_clock.to_i)
  end

  def -(other_clock)
    set(self.to_i - other_clock.to_i)
  end

  def ==(other_clock)
    self.to_i == other_clock.to_i
  end

  private
    
    # Sets the time from a number of minutes
    def set(minutes)
      @hour = hour_wrap(minutes / 60)
      @minute = minutes % 60
      self
    end

    # Wraps each hour so that there are only 24 hours in a day
    def hour_wrap(hours)
      hours % 24
    end

    # Sets hour instance variable whether hour is present or not
    def init_hour(hour)
      hour_wrap(hour ||= 0)
    end

    # Wraps each minute so that there are only 60 minutes in an hour
    def minute_wrap(minutes)
      @hour = hour_wrap(@hour + (minutes / 60))
      minutes % 60
    end

    # Sets minute instance variable whether minute is present or not
    def init_minute(minute)
      minute_wrap(minute ||= 0)
    end

    # Formats a number to have a leading 0 if needed
    def justify(num)
      num.to_s.rjust(2, '0')
    end
end
