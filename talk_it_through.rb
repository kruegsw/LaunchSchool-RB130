# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end  # clears screen first, then outputs "> hi there"



The method 'say' is called on line 8 with an explicit argument ("hi there")
and an implicit argument (block do .. end on lines 8-10).

Execution jumps to line 2 where the 'say' method is defined.
The parameter 'words' is initalized as a local variable with the same name
with the value of "hi there".
The block is passed in implicitly without being assigned to a local variable.

On line 3 the condition 'if block_given?' evaluates truthy so the keyword 'yield' is called

Execution jumps to line 8-10 where the block is defined.
On line 9 the screen is cleared.

Execution jumps back to the 'say' method line 4 where
the expression '> + "words"', which evaluates to "> hi there", is output
the return value is nil.