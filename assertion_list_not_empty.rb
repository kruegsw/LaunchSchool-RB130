require 'minitest/autorun'

class ListNotEmpty < MiniTest::Test
	def test_list_not_empty
		#arr = [1, 2]
		#assert_equal([],arr)
		arr = [1]
		assert(arr.empty?, 'the list was not empty')
	end
end