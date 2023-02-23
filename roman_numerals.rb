class RomanNumeral

	NUMERALS = [['I', 'V'],
							['X', 'L'],
							['C', 'D'],
							['M', 'V_bar']]

	def initialize(int)
		@int = int
	end

	def to_roman
		roman_numerals = ''

		@int.to_s.chars.reverse.each_with_index do |num_str, i|
			p roman_numerals = convert_digit(num_str, i) + roman_numerals
		end

		roman_numerals
	end

	def convert_digit(num_str, i)
		div, mod = num_str.to_i.divmod(5)
		if mod  == 4 && div == 0
			NUMERALS[i][0] + NUMERALS[i][1]
		elsif mod == 4 && div == 1
			NUMERALS[i][0] + NUMERALS[i+1][0]			
		elsif div == 1
			NUMERALS[i][1] + NUMERALS[i][0] * mod
		else
			NUMERALS[i][0] * mod
		end
	end

end