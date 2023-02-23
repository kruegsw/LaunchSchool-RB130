class Element

	attr_accessor :datum

	def initialize(datum, next_element = nil)
		@datum = datum
		@next_element = next_element
	end

	def next
		@next_element
	end

	def tail?
		@next_element.nil?
	end

	#def to_s
	#	datum
	#end

end


class SimpleLinkedList

	def initialize
		@linked_list = []
	end

	def size
		@linked_list.size
	end

	def empty?
		@linked_list.empty?
	end

	def push(datum)
		@linked_list.push(Element.new(datum, @linked_list.last))
	end

	def pop
		@linked_list.pop.datum
	end

	def peak

	end

	def head
		@linked_list.last
	end

	def peek
		@linked_list.last.datum unless empty?

	end
	
	def to_a
		@linked_list.reverse.map(&:datum)
	end

	def reverse
		new_list = self.class.from_a(self.to_a.reverse)
	end

	def self.from_a(arr)
		new_list = self.new
		return new_list if arr.nil?
		arr = arr.clone
		new_list.push(arr.pop) until arr.empty?
		new_list
	end

	protected

	attr_accessor :linked_list

end
