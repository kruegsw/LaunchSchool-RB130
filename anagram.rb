class Anagram

	def initialize(word)
		@word = word
	end

	def match(arr_of_words)
		arr_of_words.filter do |w|
			 same_letters?(w) && !same_word?(w)
		end
	end

	def same_letters?(w)
		@word.downcase.chars.tally == w.downcase.chars.tally
	end

	def same_word?(w)
		@word.downcase == w.downcase
	end

end