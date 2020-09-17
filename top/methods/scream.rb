def scream(words)
  words = words.upcase + "!!!!"
  puts words
  words
end

puts "What to scream?"
to_scream = gets.chomp
scream(to_scream)
