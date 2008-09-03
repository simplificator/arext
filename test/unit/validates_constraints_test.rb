require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ValidatesConstraintsTest < Test::Unit::TestCase
 
  def test_not_null_string_with_limit
    Foo.send(:validates_constraints, :not_null_string_with_limit)
    assert(valid_foo())
    assert((not valid_foo(:not_null_string_with_limit => 'x' * 11).valid?))
    assert(valid_foo(:not_null_string_with_limit => '').valid?)
    assert(valid_foo(:not_null_string_with_limit => 'x' * 10).valid?)
  end
  def test_string_with_limit
    Foo.send(:validates_constraints, :string_with_limit)
    assert(valid_foo())
    assert((not valid_foo(:string_with_limit => 'x' * 21).valid?))
    assert(valid_foo(:string_with_limit => '').valid?)
    assert(valid_foo(:string_with_limit => 'x' * 10).valid?)
    
  end
  
  def test_null_string_withouth_limit
    Foo.send(:validates_constraints, :null_string_without_limit)
    assert(valid_foo.valid?)
    assert(valid_foo(:null_string_without_limit => '').valid?)
    assert(valid_foo(:null_string_without_limit => 'x' * 5).valid?)
    assert(valid_foo(:null_string_without_limit => 'x' * 255).valid?)
    # sqllite still adds a limit for string columns (255 chars)
    assert((not valid_foo(:null_string_without_limit => 'x' * 256).valid?))
  end
  
  def test_null_boolean
    Foo.send(:validates_constraints, :null_boolean)
    assert(valid_foo.valid?)
    assert(valid_foo(:null_boolean => true).valid?)
    assert(valid_foo(:null_boolean => false).valid?)
  end

  def test_not_null_boolean
    Foo.send(:validates_constraints, :not_null_boolean)
    assert(valid_foo.valid?)
    assert(valid_foo(:not_null_boolean => true).valid?)
    assert(valid_foo(:not_null_boolean => false).valid?)
    assert((not valid_foo(:not_null_boolean => nil).valid?))
  end
  
  def test_null_integer
    Foo.send(:validates_constraints, :null_integer)
    assert(valid_foo.valid?)
    assert(valid_foo(:null_integer => nil).valid?)
    assert(valid_foo(:null_integer => 1).valid?)
    assert(valid_foo(:null_integer => 0).valid?)
    assert(valid_foo(:null_integer => -1).valid?)
  end

  def test_not_null_integer
    Foo.send(:validates_constraints, :not_null_integer)
    assert(valid_foo.valid?)
    assert((not valid_foo(:not_null_integer => nil).valid?))
    assert(valid_foo(:not_null_integer => 1).valid?)
    assert(valid_foo(:not_null_integer => 0).valid?)
    assert(valid_foo(:not_null_integer => -1).valid?)
  end 
  
    def test_null_float
    Foo.send(:validates_constraints, :null_float)
    assert(valid_foo.valid?)
    assert(valid_foo(:null_float => nil).valid?)
    assert(valid_foo(:null_float => 1.0).valid?)
    assert(valid_foo(:null_float => 0.0).valid?)
    assert(valid_foo(:null_float => -1.0).valid?)
  end

  def test_not_null_float
    Foo.send(:validates_constraints, :not_null_float)
    assert(valid_foo.valid?)
    assert((not valid_foo(:not_null_float => nil).valid?))
    assert(valid_foo(:not_null_float => 1.0).valid?)
    assert(valid_foo(:not_null_float => 0.0).valid?)
    assert(valid_foo(:not_null_float => -1.0).valid?)
  end 
  private
  
  def valid_foo(options = {})
    valid = {
      :null_string_without_limit => '', 
      :not_null_string_with_limit => '',
      :string_with_limit => '',
      :null_boolean => nil,
      :not_null_boolean => false,
      :null_integer => nil,
      :not_null_integer => 123,
      :null_float => nil,
      :not_null_float => 123.0
    }
    Foo.new(valid.merge(options))
    
  end
  
end
