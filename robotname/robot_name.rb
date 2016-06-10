class Robot
	@@stored_names = []
	
	def name
		@name ||= create_name
	end
	
	def reset
		@name = nil
	end
	
	def self.stored_names
		@@stored_names
	end
	
	private
	
	def create_name
		letter = ""
		2.times { letter += ('A'..'Z').to_a.sample }
		number = rand(100..1000)
		name = "#{letter}#{number}"
		
		if self.class.stored_names.include?(name)
			create_name
		else
			self.class.stored_names << name
			name
		end
		
	end
end