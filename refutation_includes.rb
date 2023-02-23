require 'minitest/autorun'

class ArrayRegutationTest < MiniTest::Test
	def test_refute_xyz
		list = 'xdthf'
		assert_includes(list, 'xyz')
		assert_equal(1, 2)
	end
end