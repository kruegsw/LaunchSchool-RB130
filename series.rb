class Series

	def initialize(str_of_int)
		@num_arr = str_of_int.chars.map(&:to_i)
	end

	def slices(n)
		raise ArgumentError if n > @num_arr.size
		#response = []
		#@num_arr.each_cons(n) { |i| response << i }
		#response
		@num_arr.each_cons(n).to_a
	end

end