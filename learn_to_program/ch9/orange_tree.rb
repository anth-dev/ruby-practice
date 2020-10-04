# frozen_string_literal: true

# Exercise:
# Make an OrangeTree class.
#
# It should have a height method which returns it's height, and a advance_one_year
# method, which, when called, ages the tree one year. Each year the tree grows
# taller (however much you think an orange tree should grow in a year), and after
# some number of years (again, your call) the treeshould die.
#
# For the first few years, it should not produce fruit, but after a
# while it should. Older trees produce more each year than younger trees.
# Make sure that any oranges you don't pick one year fall off before the next
# year.
#
# You should be able to count_the_oranges (which returns the number of oranges on
# the tree), and pick_an_orange (which reduces the @orange_count by one and returns
# a string telling you how delicious the orange was, or else it just tells you
# that there are no more oranges to pick this year).
#
# Notes:
# Orange trees grow to 18 to 22 feet tall.
#
# Fruit production begins between 2 to 5 years old.
#
# Average lifespan for citrus trees is 50 years.
#
# They grow about half a foot of year (22 feet / 50 years).
class OrangeTree
  def initialize
    @age = 0
    @height = 0
    @orange_count = 0
    @producing_fruit = false
    @is_living = true
  end

  def measure_the_tree
    "The tree is #{@height} inches tall."
  end

  def count_the_oranges
    "The tree has #{@orange_count} oranges."
  end

  def pick_an_orange
    if @orange_count.positive?
      @orange_count -= 1
      'You pick an orange and eat it. It was very juicy and delicious.'
    else
      'There are no oranges to pick.'
    end
  end

  def advance_one_year
    @age += 1
    check_for_death if @age >= 45
    @height += calculate_growth
    grow_oranges
    "Your tree is now #{@age} years old"
  end

  def living?
    @is_living
  end

  attr_reader :age

  attr_reader :height

  private

  def calculate_growth
    # Each year grow between 2 and 8 inches.
    rand(2..8)
  end

  def grow_oranges
    # If the tree is at least age 2 but isn't yet producing fruit run a check
    # to see if it can start producing fruit.
    check_production if @age >= 2 && @producing_fruit == false

    # Grow oranges if able to produce fruit
    @orange_count = @age * rand(2..5) if @producing_fruit == true
  end

  def check_production
    # If the tree is age 5 it can start producing automatically.
    @producing_fruit = true if @age == 5

    # Starting at age 2, give a 25% change to start orange production.
    result = rand(1..4)
    @producing_fruit = true if result == 4
  end

  # Once the tree is 45 years old give it a 10% chance of dying each year.
  def check_for_death
    result = rand(1..10)
    @is_living = false if result == 1
  end
end

planted_tree = OrangeTree.new
menu_message = 'An orange tree has been planted.'

while planted_tree.living?

  # Clear the screen before the menu is displayed.
  system 'clear'

  # Display menu.
  puts ''
  puts '-' * 80
  puts menu_message
  puts '-' * 80
  puts 'Make your selection'
  puts '1 - Measure your tree'
  puts '2 - Count the oranges'
  puts '3 - Pick an orange'
  puts '4 - Advance to the next year'
  puts '5 - Exit'

  # Get selection from the user.
  selection = gets.chomp.to_i

  case selection
  when 1
    menu_message = planted_tree.measure_the_tree
  when 2
    menu_message = planted_tree.count_the_oranges
  when 3
    menu_message = planted_tree.pick_an_orange
  when 4
    menu_message = planted_tree.advance_one_year
  when 5
    puts 'Are you sure you want to exit? Y/N'
    selection = gets.chomp.downcase
    if selection == 'y'
      puts "\nThanks for playing!"
      exit
    else
      menu_message = 'Exit cancelled'
    end
  end

end

puts "Your tree has perished. It was #{planted_tree.age} years old and grew to #{planted_tree.height} inches tall."

puts 'Thanks for playing!'
