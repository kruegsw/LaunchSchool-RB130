class Scrabble

	POINTS = {
		'q' => 10, 'z' => 10,
		'j' => 8, 'x' => 8,
		'k' => 5,
		'f' => 4, 'h' => 4, 'v' => 4, 'w' => 4, 'y' => 4,
		'b' => 3, 'c' => 3, 'm' => 3, 'p' => 3,
		'd' => 2, 'g' => 2 
	}

	def initialize(word)
		@word = word.to_s
	end

	def score
		@word.downcase.chars.map { |l| POINTS.fetch(l, 1) }.reduce(0, :+)
	end

	def self.score(word)
		word.downcase.chars.map { |l| POINTS.fetch(l, 1) }.reduce(0, :+)
	end
end