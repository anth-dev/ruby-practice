class MyCar

  attr_reader :year, :model
  attr_accessor :speed, :on, :color

  def initialize(year, model, color, speed = 0, on = false)
    @year = year
    @model = model
    @color = color
    @speed = speed
    @on = on
  end

  def accelerate=(amount)
    self.speed += amount
  end

  def decelerate=(amount)
    self.speed -= amount
  end

  def toggle_ignition
    self.on = !self.on
  end

  def paint=(color)
    self.color = color
    puts "Your #{model} has been painted #{color}"
  end

end

gti = MyCar.new(1999, "GTI", "Tropic Orange")

puts "Starting the engine"
gti.toggle_ignition
puts gti.on


puts "Accelerating"
gti.accelerate = 100
puts gti.speed

puts "Decelerating"
gti.decelerate = 100
puts gti.speed

puts "Painting your car."
gti.paint = "Electron Blue"
puts gti.color

puts "Displaying the year of your car"
puts gti.year