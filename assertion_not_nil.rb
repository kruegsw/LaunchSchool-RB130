require 'minitest/autorun'

class NotNilTest < MiniTest::Test
	def test_value_not_nil
		value = nil
		assert_equal(nil, value)
		assert_nil(value, 'value is not nil')
		value = 'ass'
		assert_nil(value, 'value is not nil')
	end
end