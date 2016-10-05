class Bar
  attr_accessor :my_foo

  def initialize
    self.my_foo =0
  end

  def self.foo
    "foo!"
  end

  def baz
    "baz!"
  end

  def self.success
    foo #looks for variable foo, doesn't find one, looks for class method foo, finds it, returns "foo!"
  end

  def self.fail
    baz #looks for variable baz, doesn't find one, looks for class method baz, doesn't find one, raises exception
  end

  def instance_success
    baz #looks for variable baz, doesn't find one, looks for instance method baz, finds it, returns "baz!"
  end

  def instance_fail
    foo #looks for variable foo, doesn't find one, looks for instance method foo, doesn't find one, raises exception
  end

  def local_variable
    baz = "is my favorite method"
    baz #looks for variable baz, finds it, returns "is my favorite method"
  end

  def disambiguate
    baz = " is my favorite method"
    self.baz + baz #looks for instance method baz, finds it, looks for local variable baz, finds it, returns "baz! is my favorite method"
  end

  def update_foo
    self.my_foo += 1

  end
end

var1 = Bar.new
var2 = Bar.new

puts var1.my_foo
puts var2.my_foo

var1.update_foo

puts var1.my_foo
puts var2.my_foo
