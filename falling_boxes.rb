Shoes.app :height => 500, :width => 250 do
	require './box.rb'
	require './player.rb'
	require './candy.rb'
	
	@points = 0
	@boxes = []
	20.times do 
		@boxes << Box.new
	end

	@candies = []
	5.times do
		@candies << Candy.new
	end

	@player = Player.new
	@speed = 100


	animate(@speed) do |frame|
		clear
		
		flow :height => 50 do
			@score = para "Score:"
			@num = para @points
		end

		stroke black
		fill black

		@boxes.each do |box|
			box.check

			if box.y > 499 
				box.respawn
			end
			
			rect(box.x, box.y, box.width, box.height)

			if box.collide?(@player)
				para "COLLISION!"
			end
		end

		fill green
		stroke green

		@candies.each do |candy|
			candy.check

			if candy.y > 499 
				candy.respawn
			end
			rect(candy.x, candy.y, candy.width, candy.height)

			if candy.collide?(@player)
				@points += 1
				candy.respawn
			end
		end

		fill red
		stroke red

		rect(@player.x, @player.y, 5, 5)

		keypress do |key|

			case key
			when :up
				@player.y -= 5
			when :left
				@player.x -= 5
			when :right
				@player.x += 5
			when :down
				@player.y += 5
			end
		end
	end
end
