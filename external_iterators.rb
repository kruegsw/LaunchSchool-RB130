

factorial = Enumerator.new do |y|
	i = 0
	loop do
		y << ( (1..i).reduce(:*) || 0 )
		i += 1
	end
end

p fact_arr = factorial.take(5)

puts
puts
p fact_arr

p factorial.next
p factorial.next
p factorial.next
p factorial.next
p factorial.next

p factorial.next
p factorial.next
p factorial.next

p factorial.rewind

p factorial.next
p factorial.next
p factorial.next
p factorial.next
p factorial.next

def internal_factorial(n)
	(1..n).each_with_index do |_, i|
		puts (1..i).reduce(:*) || 0
	end
end

internal_factorial(8)

