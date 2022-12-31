def create_hash(keys, values)
  if keys.length == 0
    h = {}
  else
    h = { keys[0]=>values }
    (0...keys.length).each { |i|
      h[keys[i]] = values[i]
    }
  end
  return h
end
