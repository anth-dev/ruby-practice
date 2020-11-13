# frozen_string_literal: true

# Use the roman_mapping hash to define a recursive method that converts an
#   integer to a Roman numeral.

def int_to_roman_numeral(integer, conversion_map, roman_numeral = [])
  return roman_numeral.join if conversion_map.empty?

  current_conversion = conversion_map.shift

  conversion_integer = current_conversion.first
  conversion_numeral = current_conversion.last

  integer / conversion_integer

  (integer / conversion_integer).times do
    roman_numeral.push(conversion_numeral)
    integer -= conversion_integer
  end

  int_to_roman_numeral(integer, conversion_map, roman_numeral)
end

roman_mapping = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

puts int_to_roman_numeral(1984, roman_mapping)
