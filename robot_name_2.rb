class Robot


	@@names = []

	def name
		return @name if @name
		@name = generate_random_name while @@names.include?(@name)
		@@names << @name
		@name
	end

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
		@name = nil
	end

end