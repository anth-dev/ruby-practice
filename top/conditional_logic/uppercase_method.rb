def caps(string)
  string.upcase unless string.length <= 10
end

puts "----------------------------------"
puts "Enter your string over 10 characters"
puts "----------------------------------"

input = gets.chomp
output_string = caps input
puts output_string