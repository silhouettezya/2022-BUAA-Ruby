def mfl(s)
  h = Hash.new(0)
  s.each_char {|c| h[c] +=1 if ('a'..'z').include?c}
  mf = h.values.max
  h.select {|k,v| v==mf}.keys
end

print mfl("Great Wall.")
