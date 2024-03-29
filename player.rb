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

		if @y < 1
			@y = 1
		end

		if @y > 495
			@y = 495
		end

		if @x < 1
			@x = 1
		end
		
		if @x > 245
			@x = 245
		end

		return true
	end
end
