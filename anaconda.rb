# Script to interpret a basic theoretical language ("anaconda") that uses only simple variable assignments, binary operators and print statements
# When run with program.an, should return 25

def interpret(lines)
  assignment_hash = {}
  output = []
  lines.each do |line|
    if line.include? "="
      lhs, rhs = line.split("=").map {|char| char.strip}
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
  elsif matchdata = expression.match(/[-+*\/]/)
    operator = matchdata.to_s 
    operands = expression.split(operator)
    operand1, operand2 = operands.map {|operand| evaluate(operand, assignment_hash)}
    case operator
      when "+"
        operand1 + operand2
      when "-"
        operand1 - operand2
      when "*"
        operand1 * operand2
      when "/"
        operand1 / operand2
    end
  end
end

ARGV.each do |filename|
  lines = File.readlines(filename)
  puts interpret(lines).join("\n")
end
