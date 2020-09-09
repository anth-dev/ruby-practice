def caps(string)
  string.upcase unless string.length <= 10
end

puts "----------------------------------"
puts "Enter your string over 10 characters"
puts "----------------------------------"

input = gets.chomp
puts caps input