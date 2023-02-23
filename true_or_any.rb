def any?(arr)
	i = 0
	while i < arr.size do # check each element
		if block_given? 
			return true if yield(arr[i]) # if any of the blocks are evaluated as true then return true
		else
			return true # if block is not given then return true
		end
		i += 1 # move to next element
	end
	false # if none of the blocks yiel
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
p any?([])
p any?([1, 2, 3])

puts "now trying strings"
p any?('ass') { |value| value == 's'}

p any?('ass') { |value| value == 't'}

puts "now trying hashes"
#p any?({1 => 1, 2 => 2}) { |e| e.key == 3}

#p any?({1 => 1, 2 => 2}) { |e| e.key == 2}


#p any?({1 => 1, 2 => 2}) { |e| e.value == 2}

puts "new method"

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
#p any?([])
#p any?([1, 2, 3])

puts "now trying strings"
#p any?('ass') { |value| value == 's'}

#p any?('ass') { |value| value == 't'}

puts "now trying hashes"
p any?({1 => 1, 2 => 2}) { |k, v| k == 3}

p any?({1 => 1, 2 => 2}) { |k, v| k == 2}


p any?({1 => 1, 2 => 2}) { |k, v| v == 2}
