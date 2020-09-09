puts "Please enter a number."
input = gets.chomp.to_i

if input > 100 then puts "#{input} is greater than 100"
elsif input > 50 then puts "#{input} is between 51 and 100"
elsif input >= 0 then puts "#{input} is between 0 and 100"
else puts "#{input} is less than 0"
end
