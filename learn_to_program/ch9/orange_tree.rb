=begin
Exercise:
Make an OrangeTree class.

It should have a height method which returns it's height, and a oneYearPasses
method, which, when called, ages the tree one year. Each year the tree grows
taller (however much you think an orange tree should grow in a year), and after
some number of years (again, your call) the treeshould die.

For the first few years, it should not produce fruit, but after a
while it should. Older trees produce more each year than younger trees.
Make sure that any oranges you don't pick one year fall off before the next
year.
  
You should be able to countTheOranges (which returns the number of oranges on
the tree), and pickAnOrange (which reduces the @orangeCount by one and returns
a string telling you how delicious the orange was, or else it just tells you
that there are no more oranges to pick this year). 

Notes:
Orange trees grow to 18 to 22 feet tall.

Fruit production begins between 2 to 5 years old.

Average lifespan for citrus trees is 50 years.

They grow about half a foot of year (22 feet / 50 years).
=end

require 'pry'

class OrangeTree

  def initialize
    @age = 0
    @height = 0
    @orangeCount = 0
    @producingFruit = false
    @isLiving = true
  end

  def measureTheTree
    "The tree is #{@height} inches tall."
  end

  def countTheOranges
    "The tree has #{@orangeCount} oranges."
  end

  def pickAnOrange
    if @orangeCount > 0
      @orangeCount -= 1
      "You pick an orange and eat it. It was very juicy and delicious."
    else
      "There are no oranges to pick."
    end
  end

  def oneYearPasses
    @age += 1
    if @age >= 45
      checkForDeath
    end
    @height += calculateGrowth
    growOranges
    "Your tree is now #{@age} years old"
  end

  def isLiving?
    @isLiving
  end

  def age
    @age
  end

  def height
    @height
  end

  private

  def calculateGrowth
    # Each year grow between 2 and 8 inches.
    rand(7) + 2
  end

  def growOranges
    # If the tree is at least age 2 but isn't yet producing fruit run a check
    # to see if it can start producing fruit.
    if (@age >= 2 && @producingFruit == false)
      checkProduction
    end
    
    # Grow oranges if able to produce fruit
    if @producingFruit == true
      @orangeCount = @age * (rand(4) + 2) 
    end

  end

  def checkProduction
    # If the tree is age 5 it can start producing automatically.
    if @age == 5
      @producingFruit = true
    end

    # Starting at age 2, give a 25% change to start orange production.
    result = rand(4) + 1
    if result == 4
      @producingFruit = true
    end
  end

  # Once the tree is 45 years old give it a 10% chance of dying each year.
  def checkForDeath
    result = rand(10) + 1
    if result == 1
      @isLiving = false
    end
  end

end

planted_tree = OrangeTree.new
menu_message = "An orange tree has been planted."

while planted_tree.isLiving? do

  # Clear the screen before the menu is displayed.
  system "clear"

  # Display menu.
  puts ""
  puts "-" * 80
  puts menu_message
  puts "-" * 80
  puts "Make your selection"
  puts "1 - Measure your tree"
  puts "2 - Count the oranges"
  puts "3 - Pick an orange"
  puts "4 - Advance to the next year"
  puts "5 - Exit"

  # Get selection from the user.
  selection = gets.chomp.to_i

  case selection
  when 1
    menu_message = planted_tree.measureTheTree
  when 2
    menu_message = planted_tree.countTheOranges
  when 3
    menu_message = planted_tree.pickAnOrange
  when 4
    menu_message = planted_tree.oneYearPasses
  when 5
    puts "Are you sure you want to exit? Y/N"
    selection = gets.chomp.downcase
    if selection == "y"
      puts "\nThanks for playing!"
      exit
    else
      menu_message = "Exit cancelled"
    end
  end

end

puts "Your tree has perished. It was #{planted_tree.age} years old and grew to #{planted_tree.height} inches tall."

puts "Thanks for playing!"

