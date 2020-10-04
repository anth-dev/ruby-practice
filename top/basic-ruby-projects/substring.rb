# frozen_string_literal: true

# Assignment.
# implement a method that takes a word as the first argument and then an array
# of valid substrings as the second argument. It should return a hash listing
# each substring (case insensitive) that was found in the original string and how
# many times it was found. It should handle multiple words.

def find_substrings(string, dictionary)
  # downcase the string
  lowercase_string = string.downcase
  # create an array to hold the results in
  confirmed = []
  # loop over the dictionary and check to see each element is part of the str
  dictionary.each do |substring|
    # for each substring #scan the string for the substring and if it's there
    # push it to the confirmed array
    confirmed.push(lowercase_string.scan(substring)) if lowercase_string.include?(substring)
  end
  # Use tally to add up the results and return the hash.
  confirmed.flatten.tally
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts find_substrings('below', dictionary)
puts find_substrings("Howdy partner, sit down! How's it going?", dictionary)
