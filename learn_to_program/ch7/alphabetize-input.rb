puts "Enter words to sort. Only one per line please."
input = gets.chomp
words = []

while input != "" do
  words.push input
  input = gets.chomp
end

puts words.sort