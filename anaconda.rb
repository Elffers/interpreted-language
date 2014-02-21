def interpret(lines)
  assignment_hash = {}
  output = []
  lines.each do |line|
    if line.include? "="
      lhs, rhs = line.split(" = ").map {|char| char.strip}
      # raise error if literal precedes equal sign?
      assignment_hash[lhs] = evaluate(rhs, assignment_hash)
    elsif line.include? "print"
      m = line.match(/print /)
      output << evaluate(m.post_match, assignment_hash)
    end
  end
  output
end

def evaluate(expression, assignment_hash)
  expression.strip!
  if expression =~ /^\d+$/
    expression.to_i
  elsif expression =~ /^\w+$/
    raise Error unless assignment_hash.has_key?(expression)
      assignment_hash[expression] 
    # this will raise error if variable is not assigned yet
  elsif md = expression.match(/[-+*\/]/)
    operator = md.to_s 
    operands = expression.split(operator)
    evaluated = operands.map {|o| evaluate(o, assignment_hash)}
    case operator
      when "+"
        evaluated.first + evaluated.last
      when "-"
        evaluated.first - evaluated.last
      when "*"
        evaluated.first * evaluated.last
      when "/"
        evaluated.first / evaluated.last
    end
  end
end

ARGV.each do |filename|
  lines = File.readlines(filename)
  puts interpret(lines).join("\n")
end
