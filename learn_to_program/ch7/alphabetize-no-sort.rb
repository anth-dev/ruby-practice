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

# as long as words array is not empty keep running
while words[0] != nil do
  # check words[0] against next item in the array
  # with the spaceship operator
  if ((words[0] <=> words[1]) == -1)
    puts "#{words[0]} comes before #{words[1]}"
  elsif ((words[0] <=> words[1]) == 0)
    puts "#{words[0]} is equivalent to #{words[1]}"
  elsif ((words[0] <=> words[1]) == 1)
    puts "#{words[0]} goes after #{words[1]}"
    words.push(words[1])
  end

  # words.shift is the iterator for testing
  words.shift
end