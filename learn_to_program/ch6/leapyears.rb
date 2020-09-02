# ask for starting year and ending year
# puts all the leap years between and including them

puts "Enter the starting year."
year = gets.chomp.to_i
puts "Enter the ending year."
end_year = gets.chomp.to_i
puts ""

while year <= end_year
    if (year % 100 == 0 and year % 400 == 0)
        puts "#{year}"
        year = year + 1
    elsif (year % 100 != 0 and year % 4 == 0)
        puts "#{year}"
        year = year + 1
    else
        year = year + 1
    end
end
