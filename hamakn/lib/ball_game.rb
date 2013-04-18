require_relative "./baseball_count"

class BallGame
  def initialize
    @count = BaseballCount.new
  end

  def print_counts_by_stream(stream = "")
    counts_by_stream(stream).join ","
  end

  private

  def counts_by_stream(stream = "")
    stream.split(//).map do |s|
      case s
      when "s"
        @count.strike
      when "b"
        @count.ball
      when "h"
        @count.hit
      when "f"
        @count.foul
      when "p" # pitcher fly
        @count.out
      end
      @count.inspect
    end
  end
end
