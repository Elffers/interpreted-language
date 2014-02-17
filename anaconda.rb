lines = File.readlines("test.an")

assignment_hash = {}
lines.each do |line|
  if line.include? "="
    array = line.split(" = ").map {|char| char.strip}
    # raise error if literal precedes equal sign?
    assignment_hash[array.first] = array.last
  elsif line.include? "print"
    m = line.match(/print /)
    assignment_hash["print"] = m.post_match
  end

end

# if key is variable, convert values of hash into literal 

assignment_hash.each do |k, v|
  if /\w/.match(k).to_s == k && v == /\d/.match(v).to_s
    assignment_hash[k] = v.to_i 
  end
end

#Parse value of assigment hash into array if contains binary operator
assignment_hash.each do |k,v|
  if v.is_a? String
    operators = %w[+ - * /]
    for x in operators
      if v.include?(x)
        assignment_hash[k] = v.partition(" #{x} ")
      end
    end
    # evaluates the variables in the expression, which should be an array
    # assignment_hash[k] = v.map do |variable|
    #   if assignment_hash[variable]
    #     variable = assignment_hash[variable] 
    #   else
    #     variable
    #   end
    # end  
  end
end

# evaluate variables in expressions
assignment_hash.each do |k, v|
  if v.is_a? Array
    assignment_hash[k] = v.map do |variable|
      if assignment_hash[variable]
        variable = assignment_hash[variable] 
      else
        variable
      end
    end  
    case 
    when assignment_hash[k].include?(" * ")
      assignment_hash[k] = assignment_hash[k].first * assignment_hash[k].last
    when assignment_hash[k].include?(" + ")
      assignment_hash[k] = assignment_hash[k].first + assignment_hash[k].last
    when assignment_hash[k].include?(" - ")
      assignment_hash[k] = assignment_hash[k].first - assignment_hash[k].last
      # etc for other operators
    end
  end
end

# print output

output = assignment_hash["print"]
assignment_hash[output] if assignment_hash.has_key? output
