Metaprogramming

.send/.define_method/.method_missing

Ruby has introspection (examine itself) powers
ex:
  obj = Object.new
  obj.methods
  => [:nil?, :===, :=~, :!~, :eql?, :hash, :<=>, :class, ...]

.methods shows what methods can be used on its class

# .send - allows methods to be called by name
ex: [].send(:count) #=> 0

allows something like below

  def do_three_times(object, method_name)
    3.times { object.send(method_name) }
  end

  class Dog
    def bark
      puts "Woof"
    end
  end

  dog = Dog.new
  do_three_times(dog, :bark)

# .define_method - allows new methods to be called dynamically

?????? need clarificaiton on makes_sound method 
How is it becoming an instance method?

# .method_missing
When a method is called, Ruby looks for the method in its class
If no method is exists, then it called #method_missing
It passes the method name, as a symbol, and any args to the response

### Type Introspection
class info can be found via .class
ex: 
  "who am i".class # => String
  "who am i".is_a?(String) # => true

  Object.is_a(Object) # => true
  Object.class # => Class
  Class.superclass # => Module
  Class.superclass.superclass # => Object

EOD, everything in Ruby is an Object

