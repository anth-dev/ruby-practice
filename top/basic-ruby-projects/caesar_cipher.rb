# make an array containing the complete alphabet
alphabet = %w[a A b B c C d D e E f F g G h H i I j J k K l L m M n N o O p P q Q r R s S t T u U v V w W x X y Y z Z]

# make a string hold shifted characters
encrypted_string = ""

# request a string
puts "Input a string to encrypt."
string = gets.chomp

# request a shift factor
puts "Input your shift."
shift = gets.chomp.to_i * 2

# split the string into an array of characters
character_array = string.split('')

# iterate over the array
character_array.each do |char|
=begin 
check to see the character is in the alphabet if it's not then shovel it into
the encrypted_string because it's a special character
=end
  if alphabet.index(char) == nil
    encrypted_string << char
  else

  # locate the character in the alphabet array and add the shift value
  index = alphabet.index(char) + shift
  
  # check to see if we need to loop around the alphabet array
  if index > alphabet.length - 1
    remainder = index % 52
    encrypted_string << alphabet[remainder]
  else
  
  # shovel the encrypted character into the string
  encrypted_string << alphabet[index]
  end
  end
end

# puts the encrypted string
puts encrypted_string
# "x" with a shift of 3 should be "a"