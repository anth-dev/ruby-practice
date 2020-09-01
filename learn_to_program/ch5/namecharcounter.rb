puts 'We are going to count the characters in your name.'
puts 'Enter your first name.'
firstName = gets.chomp
puts 'Enter your middle name.'
middleName = gets.chomp
puts 'Enter your last name.'
lastName = gets.chomp
puts "Your name #{firstName} #{middleName} #{lastName} contains #{firstName.length + middleName.length + lastName.length} characters."