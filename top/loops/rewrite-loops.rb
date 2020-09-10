=begin
Rewrite the loops from the loops lesson as different kinds of loops while
maintaining the same output.

Note: I used a random number generator to pick what loops I was converting to.
=end

puts "Loop 1 - loop loop to times loop"

i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end

puts ""

10.times do |num|
  puts "i is #{num}"
end

puts ""

puts "Loop 2 - while loop to for loop"

i = 0
while i < 10 do
  puts "i is #{i}"
  i += 1
end

puts ""

for i in 0...10
  puts "i is #{i}"
end

puts ""

puts "Loop 3 - while loop to until loop"
puts "you must enter yes to continue (currently commented out)"

# while gets.chomp != "yes" do
#   puts "Will you go to prom with me?"
# end

# puts ""

# until gets.chomp == "yes" do
#   puts "Will you go to prom with me?"
# end

puts ""

puts "Loop 4 - until loop to loop loop"

i = 0
until i >  10 do
  puts "i is #{i}"
  i += 1
end

puts ""

i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i > 10
end

puts ""

puts "Loop 5 - until loop to loop loop"
puts "you must enter yes to continue (currently commented out)"

# until gets.chomp == "yes" do
#   puts "Will you go to prom with me?"
# end

# puts ""

# loop do
#   input = gets.chomp
#   break if input == "yes"
#   puts "Will you go to prom with me?"
# end

puts ""

puts "Loop 6"