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

  def test_print_expression
    program=<<-END
x = 1
y = 3
print y-x
    END
    return_value = interpret_string(program)
    assert_equal([2], return_value)
  end

  def test_subtract
    program=<<-END
x = 1
y = 5-x
print y
    END
    return_value = interpret_string(program)
    assert_equal([4], return_value)
  end

  def test_multiply
    program=<<-END
x = 2
y = 5 * x 
print y
    END
    return_value = interpret_string(program)
    assert_equal([10], return_value)
  end

  def test_divide
    program=<<-END
x = 2
y = 5 / x
print y
    END
    return_value = interpret_string(program)
    assert_equal([2], return_value)
  end

  def test_undefined_variable
    program=<<-END
x = 2
y = 5 + z
print y
    END
    return_value = interpret_string(program)
    assert_equal([2], return_value)
  end

  def test_non_binary_add1
    program=<<-END
x = 2
y = 5 + x + 3
print y
    END
    return_value = interpret_string(program)
    assert_equal([10], return_value)
  end

  def test_non_binary_add2
    program=<<-END
x = 2
y = 5 + 3 + x
print y
    END
    return_value = interpret_string(program)
    assert_equal([10], return_value)
  end
  
  # test variable that hasn't been defined
  # test non-binary expressions
end
