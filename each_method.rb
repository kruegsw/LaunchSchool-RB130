[1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]
[1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3]


def each_new(arr)
	i = 0
	while i < arr.size do
		yield(arr[i]) if block_given?
		i += 1
	end
	arr.clone
end

each_new([1, 2, 3]) { |num| puts "do nothing" }                           # still returns [1, 2, 3]
each_new([1, 2, 3]) {|num| puts "do nothing"}.select{ |num| num.odd? }     # => [1, 3]


class Array
	def each_new_two
		i = 0
		while i < self.size do
			yield(self[i]) if block_given?
			i += 1
		end
		self
	end
end


p [1, 2, 3].each_new_two { |num| puts "do nothing" }                           # still returns [1, 2, 3]
p [1, 2, 3].each_new_two{|num| puts "do nothing"}.select{ |num| num.odd? }     # => [1, 3]
