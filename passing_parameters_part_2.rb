def splat_test(arr)
	puts yield(arr)
end

arr = %w(raven finch hawk eagle)
puts arr.class

ass = 'ass'

splat_test(arr) { |a,b,c,d, e, f| puts "#{a} #{b} #{c}_#{d}_#{e}_#{f}_" }

splat_test(arr) { |_,_,*raptors| raptors }

splat_test(arr) {
	not_used_1, not_used_2, *raptors = arr
	raptors
}

splat_test(*[arr]) {
	not_used_1, not_used_2, *raptors = *arr
	raptors
}

splat_test(arr) { |raptors| raptors.class }

splat_test(arr) { |a, *raptors| a.class }
splat_test(arr) { |a, *raptors| raptors.class } #it's as if the splat operators knows if parameters are split or not