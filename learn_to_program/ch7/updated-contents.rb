contents = ["Table of Contents", "Chapter 1: Numbers", "page 1", "Chapter 2: Letters", "page 72", "Chapter 3: Variables", "page 118"]

lineWidth = 60
puts "#{contents[0]}\n".center lineWidth
puts "#{contents[1]}".ljust(lineWidth/2) + "#{contents[2]}\n".rjust(lineWidth/2)
puts "#{contents[3]}".ljust(lineWidth/2) + "#{contents[4]}\n".rjust(lineWidth/2)
puts "#{contents[5]}".ljust(lineWidth/2) + "#{contents[6]}\n".rjust(lineWidth/2)
