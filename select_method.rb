def select(arr)
	i = 0
	arr_new = []
	while i < arr.size
		if block_given?
			arr_new << arr[i] if yield(arr[i])
		end
		i += 1
	end
	arr_new
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
