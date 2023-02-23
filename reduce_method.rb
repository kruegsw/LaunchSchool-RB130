def reduce(arr, acc = 0)
	i = 0
	while i < arr.size
		acc = yield(acc, arr[i])
		i += 1
	end
	acc
end