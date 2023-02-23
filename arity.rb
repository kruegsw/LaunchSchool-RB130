# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc          # #<Proc:0x00005582c9b7c2c0 arity.rb:2>
puts my_proc.class    # Proc
my_proc.call          # This is a .
my_proc.call('cat')   # This is a cat.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda        # #<Proc:0x00005582c9b7b7a8 arity.rb:9 (lambda)>
puts my_second_lambda # #<Proc:0x00005582c9b7b758 arity.rb:10 (lambda)>
puts my_lambda.class  # Proc
my_lambda.call('dog') # This is a dog.
#my_lambda.call        # ArgumentError
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # NameError ('Lambda')

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # This is a .
#block_method_1('seal') # LocalJumpError (no block given)

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # This is a trutle and a .
end
block_method_2('turtle') { puts "This is a #{animal}."} # NameError (undefined local variable or merthod 'animal')