class SumOfMultiples

	def initialize(*args)
		@divisors_arr = args.empty? ? [3, 5] : args
		#@divisors_arr = *args
		#@divisors_arr = [3, 5] if @divisors_arr.empty?
	end

	def to(limit)
		#meth = self.method(:multiple_of)
		#multiple_of = proc { |n| @divisors_arr.all? { |mult| n % mult == 0 } }
		(1...limit).filter(&multiple_of_divisors).sum
		#(1...limit).filter(&meth).sum
	end

	def self.to(limit)
		self.new.to(limit)
	end


	def multiple_of(n)
		@divisors_arr.any? do |mult|
			n % mult == 0
		end
	end

	def multiple_of_divisors
		Proc.new { |n| @divisors_arr.any? { |mult| n % mult == 0 } }
	end

	#def to_s
	#	@divisors_arr
	#end

end

#a = SumOfMultiples.new(1, 2, 3, 7)
#p a.to_s

a = SumOfMultiples.new
p a.to_s
p a
p a.to(20)

b = SumOfMultiples.new(4)
p b.to_s
p b
p b.to(20)