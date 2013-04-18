StructBallCount = Struct.new(:s, :b, :o)

class BaseballCount
  def initialize
    @count = StructBallCount.new(0, 0, 0)
  end

  def inspect
    [@count.o, @count.s, @count.b].join ""
  end

  def strike
    @count.s += 1
    judge_swing_out
  end

  def ball
    @count.b += 1
    judge_fourball #英語だと BB = Base on balls だけどな！
  end

  def out
    @count.o += 1
    judge_change
    reset_strike_and_ball
  end

  def hit
    reset_strike_and_ball
  end

  def foul
    @count.s += 1 if @count.s < 2
  end

  private

  def reset_strike_and_ball
    @count.s = 0
    @count.b = 0
  end

  def judge_swing_out
    if @count.s == 3
      @count.s = 0
      @count.o += 1
      judge_change
    end
  end

  def judge_fourball
    if @count.b == 4
      reset_strike_and_ball
    end
  end

  def judge_change
    if @count.o == 3
      change
    end
  end

  def change
    reset_strike_and_ball
    @count.o = 0
  end
end
