import sys
print sys.argv[1]
source = file(sys.argv[1])
lines = source.readlines()
source.close()

# x = 5
# y = x * x
# print y

def interpret(lines):
    assignment_hash = {}
    output = []
    for line in lines:
      if "=" in line:
          lhs, rhs = line.split("=")
          assignment_hash[lhs.strip()] = evaluate(rhs.strip(), assignment_hash)
      elif "print" in line:
          print_statement = evaluate(line[6:], assignment_hash)
          output.append(print_statement)
    print output

def is_int(expression):
    try: int(expression)
    except ValueError:
       return False
    return True

def evaluate(expression, assignment_hash):
  expression = expression.strip()
  if is_int(expression):
      return int(expression)
  elif expression in assignment_hash:
      return assignment_hash[expression]
  else:
      operand1, operator, operand2 = expression.partition('*')
      return evaluate(operand1, assignment_hash) * evaluate(operand2, assignment_hash)

interpret(lines)