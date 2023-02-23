require 'pry'

def max_by(arr)

	i = 0
	max_position = 0
	while i < arr.size
		max_position = i if yield(arr[i]) > yield(arr[max_position])
		i += 1
	end
	puts "max_position is #{max_position} and max is #{arr[max_position]}."
	arr[max_position]

end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil