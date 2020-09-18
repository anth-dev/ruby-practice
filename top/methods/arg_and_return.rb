def output_and_return(str1, str2)
  puts "#{str1.capitalize + str2.capitalize}"
  str2
end

puts "Enter the first string."
str1 = gets.chomp

puts "Enter the second string."
str2 = gets.chomp

output_and_return(str1, str2)
