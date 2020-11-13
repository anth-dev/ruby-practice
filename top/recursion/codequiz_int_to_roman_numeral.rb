# frozen_string_literal: true

# Use the roman_mapping hash to define a recursive method that converts an
#   integer to a Roman numeral.

def to_roman_numeral(integer, conversion_map, roman_numeral = [])
  return roman_numeral if conversion_map.empty?

  # Shift the first item out of the conversion map to work with.
  current_conversion = conversion_map.shift

  conversion_integer = current_conversion.first 
  conversion_numeral = current_conversion.last

  puts "#{conversion_integer} #{conversion_numeral}"
  
  # Do math with the conversion_integer to find how many times it goes into the
  #   integer.

  # For each time that conversion_integer went into integer push the conversion
  #   numeral to the roman numeral array.

  # Subtract the amount converted from integer.

  # Call the method again
  to_roman_numeral(integer, conversion_map)
end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

puts to_roman_numeral(1000, roman_mapping)
