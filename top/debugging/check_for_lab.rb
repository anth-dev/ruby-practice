def check_for_lab(string)
  # check if string contains "lab"
  print string if string.downcase.include?("lab")
end

check_for_lab("laboratory")
check_for_lab("experiment")
check_for_lab("Pans Labyrinth")
check_for_lab("elaborate")
check_for_lab("polar bear")