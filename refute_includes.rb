require 'minitest/autorun'

class ArrayRegutationTest < MiniTest::Test
	def test_refute_xyz
		list = 'xdthf'
		assert_includes(list, 'xyz')
	end
end