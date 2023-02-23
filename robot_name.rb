class Robot


	@@names = []

	attr_reader :name

	def generate_random_name
		name = ""
		name << ('A'..'Z').to_a.sample
		name << ('A'..'Z').to_a.sample
		name << ('1'..'9').to_a.sample
		name << ('1'..'9').to_a.sample
		name << ('1'..'9').to_a.sample
	end

	def reset
		@@names.delete(@name)
		while @@names.include?(@name)
			@name = generate_random_name
		end
		@@names << @name
	end

end