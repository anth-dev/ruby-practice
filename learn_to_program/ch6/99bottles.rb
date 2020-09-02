bottles = 99
while bottles >= 0
    if bottles == 0
        puts "no more bottles of beer on the wall,"
        puts "no more bottles of beer"
        puts "BEER RUN!"
        bottles = bottles - 1
    elsif bottles == 1
        puts "one more bottle of beer on the wall,"
        puts "one more bottle of beer,"
        puts "take one down and pass it around,"
        bottles = bottles - 1
        puts "now there's,"
    else
        puts "#{bottles} bottles of beer on the wall,"
        puts "#{bottles} bottles of beer,"
        puts "take one down and pass it around,"
        bottles = bottles - 1
        puts "now there's,"
    end
end