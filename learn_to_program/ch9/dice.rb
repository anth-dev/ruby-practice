class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

  def cheat(num)
    if num > 6
      @numberShowing = 6
    elsif num < 1
      @numberShowing = 1
    else
    @numberShowing = num
    end
  end

end

puts Die.new.showing
puts Die.new.cheat(10)
puts Die.new.cheat(-999)
