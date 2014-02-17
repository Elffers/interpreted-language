import sys #basic module, like requiring a gem
print sys.argv[1] #looking for all the arguments after the python command in c-line
source = file(sys.argv[1])
lines = source.readlines()

#interpret here

# x = 5
# y = x * x
# print y

for line in lines:
  print line.split()

source.close()
