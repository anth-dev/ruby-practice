# frozen_string_literal: true

# Use the roman_mapping hash to define a recursive method that converts an
# integer to a Roman numeral.

def to_roman_numeral(int, conversion_map, )
  # Shift the first item out of the conversion map to work with.

  # Divide the integer by the shifted key's value. ??
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
