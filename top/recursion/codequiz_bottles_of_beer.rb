# frozen_string_literal: true

# Define a recursive function that takes an argument n and prints "n bottles of
# beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles
# of beer on the wall".

def puts_beer(bottles)
  if bottles.zero?
    puts 'No more bottles of beer on the wall, no more bottles of beer.'
    puts 'BEER RUN!'
    exit
  else
    puts "#{bottles} bottles of beer on the wall. #{bottles} bottles of beer."
    puts "Take one down and pass it around, now there's...."
    puts_beer(bottles - 1)
  end
end

puts_beer(99)
