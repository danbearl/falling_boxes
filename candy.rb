class Candy < Box
	def initialize
		super
		@width = 5
		@height = 5
	end

	def respawn
		super
		@width = 5
		@height = 5
	end
end
