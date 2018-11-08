class HighScores
  attr_reader :scores, :latest, :highest, :top, :report

  def initialize(scores_array)
    @scores = scores_array
    @latest = scores_array[-1] 
    @highest = scores_array.max
    @top = scores_array.max(3)
    @report = generate_report
  end

  def generate_report
    first_part = "Your latest score was #{@latest}. "
    if @latest >= @highest
      second_part = "That's your personal best!"
    else
      second_part = "That's #{@highest - @latest} short of your personal best!"
    end
    first_part + second_part
  end
end
