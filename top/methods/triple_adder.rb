def triple_adder(a, b, c)
  sum = "#{a + b + c}!"
end

puts "Enter first addend"
first_addend = gets.chomp.to_i

puts "Enter second addend"
second_addend = gets.chomp.to_i

puts "Enter third addend"
third_addend = gets.chomp.to_i

puts triple_adder(first_addend, second_addend, third_addend)