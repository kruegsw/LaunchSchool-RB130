class Diamond

	def self.make_diamond(letter)
		return "A\n" if letter == "A"

		width = determine_width(letter)
		diamond_arr = build_diamond_arr(width, letter)
		diamond_text = diamond_arr.join("\n")

	end

	class << self

		private

		def determine_width(letter)
			letter_count = ('A'..letter).count
			width = (letter_count*2)-1
		end

		def build_diamond_arr(width, letter)
			diamond_upper = []
			diamond_upper << " "*(width/2) + "A" + " "*(width/2)
			diamond_lower = []
			diamond_lower << " "*(width/2) + "A" + " "*(width/2) + "\n"
			('B'...letter).each_with_index do |l, i|
				text = ""
				text << " " * (width/2 - i - 1)
				text << l
				text << " "*(i*2+1)
				text << l
				text << " " * (width/2 - i - 1)
				diamond_upper << text
				diamond_lower.unshift text
			end
			diamond_middle = [letter + " "*(width-2) + letter]

			diamond = diamond_upper + diamond_middle + diamond_lower
		end

	end

end

answer = Diamond.make_diamond('E')
puts answer
p answer