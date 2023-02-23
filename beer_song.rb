class BeerSong

	def self.verse(n)
		case n
			when 99
				response = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
					"Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
			#when (3..98)
			#	response = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
			#		"Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
			when (3..98)
				response = <<-SONG
#{n} bottles of beer on the wall, #{n} bottles of beer.
Take one down and pass it around, #{n-1} bottles of beer on the wall.
SONG
			when 2
				response = <<-SONG
#{n} bottles of beer on the wall, #{n} bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
					SONG
			when 1
				response = <<-SONG
#{n} bottle of beer on the wall, #{n} bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
					SONG
			when 0
				response = <<-SONG
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
					SONG
			end
	end

	def self.verses(*args)
		verses_arr = (args.min..args.max).to_a.reverse
		response = verse(verses_arr.shift)
		verses_arr.each { |v| response += "\n" + verse(v) }
		response		
	end

	def self.lyrics
		all_verses = (0..99).to_a
		verses(*all_verses)
	end

end

p BeerSong.verse(99)

#puts BeerSong.verses(1, 2, 0, 3)

BeerSong.verses(99, 98)