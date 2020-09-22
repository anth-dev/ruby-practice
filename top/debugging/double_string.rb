def double_words_in_phrase(string)
  string_array = string.split(' ')
  doubled_string = string_array.map { |word| word * 2}
  doubled_string.join(' ')
end

puts double_words_in_phrase("This is a test")
