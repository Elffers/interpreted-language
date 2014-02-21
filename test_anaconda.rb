require_relative 'anaconda'
require 'test/unit'

def interpret_string(program)
  return interpret(program.split("\n"))
end

class TestAnaconda < Test::Unit::TestCase
  def test_print
    program =<<-END
x = 1
print x
    END
    return_value = interpret_string(program)
    assert_equal([1], return_value)
  end
  
  def test_print_literal
    program =<<-END
print 1
    END
    puts program
    return_value = interpret_string(program)
    assert_equal([1], return_value)
  end

  def test_print_multiple
    program=<<-END
x = 1
print x
y = x + x
print y
    END
    return_value = interpret_string(program)
    assert_equal([1, 2], return_value)
  end

  # test all the operators
  # test variable that hasn't been defined
  # test non-binary expressions
end
