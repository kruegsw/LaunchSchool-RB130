class Clock

	def initialize(hour, minute)
		@hour = hour
		@minute = minute
	end

	def self.at(hour, minute = 0)
		self.new(hour, minute)
	end

	def +(minutes)
		time_in_minute = @hour * 60 + @minute
		time_in_minute += minutes
		_, time_in_minute = time_in_minute.divmod(60*24)
		@hour, @minute = time_in_minute.divmod(60)
		Clock.at(@hour, @minute)
	end

	def -(minutes)
		self.+(-minutes)
	end

	def ==(other)
		self.to_s == other.to_s
	end

	def to_s
		"%02d:%02d" % [@hour, @minute]
	end

end


clock = Clock.at(10) + 3
#assert_equal '10:03',
p clock.to_s