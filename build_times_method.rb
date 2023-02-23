# mimic the Integer#times method, example below
5.times do |num|
  puts num
end

# 0
# 1
# 2
# 3
# 4


5.times

class Integer
	def times_new
		i = 0
		while i < self do
			yield(i) if block_given?
			i += 1
		end
		self
	end
end

5.times_new { |num| puts "you be an ass #{num}" }

5.times_new