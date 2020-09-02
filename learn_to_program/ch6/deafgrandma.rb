puts "What would you like to say to Granny?"
str = gets.chomp
bye_count = 0
while (bye_count < 3)
    if (str == str.upcase and str != 'BYE')
        bye_count = 0
        puts "NO, NOT SINCE #{rand(1930..1950)}!"
        puts "What would you like to say to Granny?"
        str = gets.chomp
    elsif (str != str.upcase and str != 'BYE')
        bye_count = 0
        puts "HUH?! SPEAK UP, SONNY!"
        puts "What would you like to say to Granny?"
        str = gets.chomp
    elsif str == 'BYE'
        bye_count = bye_count + 1
        if bye_count == 3
            puts 'BYE SONNY!'
        else
        puts 'YOU GOT WHAT IN YOUR EYE?!?'
        puts "What would you like to say to Granny?"
        str = gets.chomp
        end      
    end
end