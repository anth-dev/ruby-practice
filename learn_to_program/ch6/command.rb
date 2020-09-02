command = ''

while command != 'bye'
    if command == ''
        command = gets.chomp
    end
    puts command
    command = gets.chomp
end

puts 'Come again soon!'