class Vehicle

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "There has been #{@@number_of_vehicles} created."
  end

  def to_s
    "This vehicle is a #{year} #{model} in #{color}."
  end

  def self.fuel_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of fuel."
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

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end

end

module Stuntable

  def stunt
    puts "Doing a stunt!"
  end

end

class MyCar < Vehicle

  attr_reader :year, :model
  attr_accessor :speed, :on, :color

  def initialize(year, model, color, speed = 0, on = false)
    @year = year
    @model = model
    @color = color
    @speed = speed
    @on = on
    @@number_of_vehicles += 1
  end

  NUMBER_OF_WHEELS = 4

end

class MyMotorcycle < Vehicle

  attr_reader :year, :model
  attr_accessor :speed, :on, :color

  include Stuntable

  def initialize(year, model, color, speed = 0, on = false)
    @year = year
    @model = model
    @color = color
    @speed = speed
    @on = on
    @@number_of_vehicles += 1
  end

  NUMBER_OF_WHEELS = 2

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

MyCar.fuel_mileage(12, 250)

eclipse = MyCar.new(1999, "Eclipse GSX", "Black")
grom = MyMotorcycle.new(2020, "Grom", "Green")

puts Vehicle.number_of_vehicles

puts gti
puts eclipse
puts grom

grom.stunt

puts MyCar.ancestors
puts MyMotorcycle.ancestors
puts Vehicle.ancestors

puts gti.age
