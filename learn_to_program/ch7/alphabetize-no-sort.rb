# going to try a different direction then the method below 

# def find_lowest(word, array)
#   puts "Find lowest is running with: #{word}, #{array}"
#   i = 0
#   while i <= (array.length - 1) do
#     current_result = word <=> array[i]
#     p current_result
#     if current_result == -1
#       puts "#{array[i]} comes after #{word}" 
#     end
#     i += 1
#   end  
# end

puts "Enter words to sort. Only one per line please."
raw_input = gets.chomp
words = []
output = []

# get input until an empty string is entered
while raw_input != "" do
  input = raw_input.downcase
  words.push input
  raw_input = gets.chomp
end

p words

# keep track of output from spaceship operator
neg_one_counter = 0
zero_counter = 0
one_counter = 0
# as long as words is not empty keep running
while words[0] != nil do
  # check words[0] against all other items in the array
  # with the spaceship operator and record the results
  if ((words[0] <=> words[1]) == -1)
    puts "#{words[0]} comes before #{words[1]}"
  elsif ((words[0] <=> words[1]) == 0)
    puts "#{words[0]} is equivalent to #{words[1]}"
  elsif ((words[0] <=> words[1]) == 1)
    puts "#{words[0]} goes after #{words[1]}"
  end

  # words.shift is the iterator
  words.shift
end