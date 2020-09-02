puts "What would you like to say to Granny?"
str = gets.chomp
while str != 'BYE'
    if str == str.upcase
        puts "NO, NOT SINCE #{rand(1930..1950)}!"
        puts "What would you like to say to Granny?"
        str = gets.chomp
    else
        puts "HUH?! SPEAK UP, SONNY!"
        puts "What would you like to say to Granny?"
        str = gets.chomp
    end
end
puts "YOU GOT WHAT IN YOUR EYE?!"