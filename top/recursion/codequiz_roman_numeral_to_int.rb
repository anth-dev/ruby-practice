# frozen_string_literal: true

# Use the roman_mapping hash to define a recursive method that converts a Roman
#   numeral to an integer.

def roman_numeral_to_int(roman_numeral, conversion_map, integer = 0)
  return integer if conversion_map.empty?

  # Shift out the current conversion information.
  current_conversion = conversion_map.shift

  # Store the numeral and integer conversion values in their own variables.
  conversion_numeral = current_conversion.first
  conversion_integer = current_conversion.last

  # Check how many times the conversion numeral occurs at the start of the
  #   roman_numeral string and add the numeral's value to integer. Also remove
  #   the converted numerals from roman_numeral.

  roman_numeral_to_int(roman_numeral, conversion_map, integer)
end

roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

puts roman_numeral_to_int('MCMLXXXIV', roman_mapping)
