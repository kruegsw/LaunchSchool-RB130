require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test

	def setup
		puts "setup invoked inside CarTest"
	end

	def test_car_exists
		car = Car.new
		assert(car)
	end

	def test_wheels
		car = Car.new
		assert_equal(4, car.wheels)
	end

	def test_name_is_nil
		car = Car.new
		assert_nil(car.name)
	end

	def test_raise_initialize_with_arg
		assert_raises(ArgumentError) do
			car = Car.new('ass')
		end
	end

	def test_instance_of
		car = Car.new
		assert_instance_of(Car, car)
	end

	def teardown
		puts "teardown method invoked"
	end

end