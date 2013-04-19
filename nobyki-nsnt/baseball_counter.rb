#!/usr/bin/env ruby

class BaseballCounter
  def initialize
    @score = ["000"] # OutStrikeBall
  end

  def count(input)
    input.chars do |char|
      @score << count_one(char)
    end
    @score.join(",")
  end

  def count_one(char)
    case char
    when "s"
      strike
    when "b"
      ball
    when "f"
      foul
    when "h"
      hit
    when "p"
      pitcher_fly
    end
  end

  def strike
    last = @score[-1]
    case last[1]
    when "2"
      case last[0]
      when "2"
        "000"
      when "0".."1"
        last[0].succ << "00"
      end
    when  "0".."1"
      last[0] << last[1].succ << last[2]
    end
  end

  def ball
    last = @score[-1]
    case last[2]
    when "3"
      last[0] << last[1] << "0"
    when  "0".."2"
      last[0] << last[1] << last[2].succ
    end
  end

  def foul
    last = @score[-1]
    case last[1]
    when "2"
      last
    when  "0".."1"
      last[0] << last[1].succ << last[2]
    end
  end

  def hit
    last = @score[-1]
    last[0] << "002"
  end

  def pitcher_fly
    last = @score[-1]
    case last[0]
    when "2"
      "000"
    when "0".."1"
      last[0].succ << "00"
    end
  end
end


