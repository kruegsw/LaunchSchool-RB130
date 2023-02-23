include 'minitest/autorun'

class ExceptionTest < MiniTest:Test
	def test_raise_exception
		assert_raises (NoExperienceError) { |_| employee.hire }
	end
end