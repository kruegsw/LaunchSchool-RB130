require 'minitest/autorun'

class ValueOddTest < MiniTest::Test
	
	def test_value_odd
		value = 3
		assert(value.odd?, 'the value is not odd')
				value = 4
		assert(value.odd?, 'the value is not odd')
	end

end