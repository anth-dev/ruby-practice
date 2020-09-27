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

  def height
    "The tree is #{@height} inches tall."
  end

  def oneYearPasses
    @age += 1
    @height += calculateGrowth
    "Your tree is now #{@age} years old"

  end

  def isLiving?
    @isLiving
  end

  private

  def calculateGrowth
    rand(5) + 2
  end

end

planted_tree = OrangeTree.new
menu_message = "An orange tree has been planted."

while planted_tree.isLiving? do
  system "clear"
  puts ""
  puts "-" * 80
  puts menu_message
  puts "-" * 80
  puts "Make your selection"
  puts "1 - Measure your tree"
  puts "2 - Advance to the next year"
  puts "3 - Exit"
  selection = gets.chomp.to_i

  case selection
  when 1
    menu_message = planted_tree.height
  when 2
    menu_message = planted_tree.oneYearPasses
  when 3
    puts "Are you sure you want to exit? Y/N"
    selection = gets.chomp
    if selection == "Y"
      puts "\nThanks for playing!"
      exit
    else
      menu_message = "Exit cancelled"
    end
  end

end


