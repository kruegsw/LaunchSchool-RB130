require 'date'

class Meetup

	SHORTHAND = {
		'first' => 0,
		'second' => 1,
		'third' => 2,
		'fourth' => 3,
		'fifth' => 4
	}

	def initialize(year, month)
		@date = Date.new(year, month)
	end

	def day(week_day, month_day)
		date_counter = @date
		date_arr = []
		while (date_counter.month == @date.month)
			date_arr << date_counter if date_counter.method("#{week_day.downcase}?").call 
			date_counter += 1
		end
		p date_arr
		case month_day
		when "teenth"
			date_arr.filter { |date| (13..19).include?(date.mday) }[0]
		when "last"
			date_arr.last
		when "first"
			date_arr.first
		else
			date_arr[SHORTHAND.fetch(month_day.downcase)]
		end
	end

end

meetup = Meetup.new(2013, 3)
meetup.day('Monday', 'first')