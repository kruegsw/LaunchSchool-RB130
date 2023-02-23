require 'minitest/autorun'

require_relative 'swap_letters.rb'
#require_relative 'sample_text.txt'

class SwapLettersTest < MiniTest::Test

	def setup
		@file = File.open('./sample_text.txt', 'r')
		@text = Text.new(@file.read.clone)
	end

	def test_swap
		puts @file.read
		assert_equal(File.read(@file).gsub("a","e"),@text.swap("a", "e"))
	end

	def test_word_count
		assert_equal(File.read(@file).split.count, @text.word_count)
	end

	def teardown
		@file.close
	end

end