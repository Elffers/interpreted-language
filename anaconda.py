import sys #basic module, like requiring a gem
print sys.argv[1] #looking for all the arguments after the python command in c-line
source = file(sys.argv[1])
lines = source.readlines()
source.close()

#interpret here

# x = 5
# y = x * x
# print y


def interpret(lines):
    assignment_hash = {}
    output = []
    for line in lines:
      if "=" in line:
          lhs, rhs = line.split("=")
          assignment_hash[lhs.strip()] = rhs.strip()
      elif "print" in line:
          output.append(line) # TODO: line will be the thing after print that postmatch does
    print output

def evaluate():
  pass



interpret(lines)

