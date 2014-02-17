lines = File.readlines("program.an")

assignment_hash = {}
lines.each do |line|
  if line.include? "="
    array = line.split(" = ").map {|char| char.strip}
    # raise error if literal precedes equal sign?
    assignment_hash[array.first] = array.last
  end

end

# Parse value of assigment hash if contains binary operator
assignment_hash.each do |k,v|
 operators = %w[= - * /]
  for x in operators
    if v.include?(x)
      assignment_hash[k] = v.partition(x)
    end
  end
end

assignment_hash
