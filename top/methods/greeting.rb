def greeting (name)
  string = "Hello #{name}!"
  puts string
  string
end

puts "Enter your name"
user_input = gets.chomp

greeting(user_input)
