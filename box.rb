class Box
	attr_accessor :y, :x, :width, :height, :stroke, :fill, :speed, :count

	def initialize
		rnd = Random.new
		@width = rnd.rand(5..50)
		@height = rnd.rand(5..50)
		@speed = rnd.rand(1..10)
		@count = 0
		@x = rnd.rand(1..200)
		@y = 55
	end

	def check
		@count += 1
		if @count == @speed 
			@y += 1
			@count = 0
		end
	end

	def collide?(player)
		px = []
		py = []
		bx = []
		by = []

		(player.x..player.x+5).each do |i|
			px << i
		end

		(player.y..player.y+5).each do |i|
			py << i
		end

		(@x..@x+@width).each do |i|
			bx << i
		end

		(@y..@y+@height).each do |i|
			by << i
		end
		if (px & bx).length > 0  && (py & by).length > 0
			true
		else
			false
		end
	end

	def respawn
		@y = 55
		rnd = Random.new
		@width = rnd.rand(5..50)
		@height = rnd.rand(5..50)
		@speed = rnd.rand(1..10)
		@count = 0
		@x = rnd.rand(1..200)
	end
end
