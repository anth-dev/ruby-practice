def countdown(start)
  if start >= 0
    puts start
    countdown(start - 1)
  end
end

countdown(11)