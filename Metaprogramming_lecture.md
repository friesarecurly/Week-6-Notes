Metaprogramming lecture

Defining behavior that will define future behavior
ex: attr_reader/writer

Classes are instances of Class.class itself
So Class instance variables are possible
`@` Class instance vars are not shared 
`@@` Class variables are shared


iv = @instance_var
iv.instance_variable_get(@instance_var)
- allows private instance vars to be obtained

iv.instance_variable_set(@instance_var, new val to assign)
- allows private instance vars to be set
- any changes will affect only the instance called on. actual hard code does not change

.send - when called on receiver, invokes the arg as a method on the receiver

arguments must be passed in as symbol or string
  def invoke_methods(method_1, method_2)
    self.send(method_1) # self.[value_of_method_1]
    self.send(method_2)
  end

.define_method allows methods to be created on the fly

def self.create_tricks(*tricks) 
  tricks.each do |trick|
    # trick is method name, block is what method does 
    define_method(trick) do |num = 1|<--- pipes determines arguments taken in
      num.times do
        puts"#{trick}ing"
      end
      nil
    end
  end
end

create_tricks :eat, :sleep, :drink, :juggle