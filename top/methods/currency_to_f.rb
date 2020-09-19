class String
  def convert_to_f
    # do stuff
    self.gsub(/[$,]/, '').to_f
  end
end

puts "Enter currency to convert to a float"
puts "-" * 40
puts gets.chomp.convert_to_f
