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
input = gets.chomp
words = []

# get input until an empty string is entered
while input != "" do
  words.push input
  input = gets.chomp
end

# as long as words is not empty keep running
while words[0] != nil do
  p words
  words.shift
end

# Now without using the built-in sort method
# puts words.sort