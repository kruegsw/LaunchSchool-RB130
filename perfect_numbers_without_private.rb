class PerfectNumber

	def self.classify(number)
		error_check(number)
		aliquot_sum = divisors(number).reduce(:+)
		case (aliquot_sum <=> number)
		when 1
			'abundant'
		when 0
			'perfect'
		when -1
			'deficient'
		end

	end

	def self.divisors(number)
		(1...number).filter { |n| number % n == 0 }
	end

	def self.error_check(number)
		raise StandardError if number < 1 
	end

end