require 'minitest/autorun'

class DowncaseTest < Minitest::Test
	def test_downcase_xyz
		str = 'XYz'
		assert_equal('xyz', str.downcase)
	end
end