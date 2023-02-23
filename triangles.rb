class Triangle

	def initialize(one, two, three)
		@one = one
		@two = two
		@three = three
		@triangle = [@one, @two, @three]
		raise ArgumentError.new('argument error') if not is_triangle? or not all_positive?
	end

	def kind
		return 'equilateral' if triangle.all? { |side| side == triangle[0] }
		return 'isosceles' if triangle.uniq.size == 2
		return 'scalene' if triangle.uniq.size == 3
	end

	private

	attr_accessor :triangle

	def is_triangle?
		sum_shorter_sides = triangle.sort[0..1].sum
		longest_side = triangle.sort.max
		sum_shorter_sides > longest_side
	end

	def all_positive?
		triangle.all? { |side| side > 0 }
	end

end