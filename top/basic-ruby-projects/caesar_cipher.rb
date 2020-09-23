def caesar(string, shift)
  puts "#{string} #{shift}"
end

# request a string
puts "Input a string to encrypt."
string = gets.chomp
# request a shift factor
puts "Input your shift."
shift = gets.chomp.to_i
# do it!
puts caesar(string, shift)