class Player

	attr_accessor :x, :y

	def initialize
		@x = 100
		@y = 200
	end

	def move(key)
		
		case key
		when :up
			@y -= 5
		when :left
			@x -= 5
		when :right
			@x += 5
		when :down
			@y += 5
		end

		return true
	end
end
