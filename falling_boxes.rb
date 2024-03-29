Shoes.app :height => 500, :width => 250 do

	require './box.rb'
	require './player.rb'
	require './candy.rb'
	require './methods.rb'

	
	$points = 0
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
	@lives = 3
	@game_over = false

	@score_box = flow :height => 30

	@field = flow {}


	animate(@speed) do |frame|

		if @lives <= 0 and @game_over == false
			@game_over = true
			game_over
			close
		end

		@score_box.clear do
			@score = para "Score:"
			@num = para $points
			para "Lives:"
			para @lives
		end

		@field.clear do

			stroke black
			fill black

			@boxes.each do |box|
				box.check

				if box.y > 499 
					box.respawn
				end
				
				rect(box.x, box.y, box.width, box.height)

				if box.collide?(@player)
					box.respawn
					@lives -= 1
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
					$points += 1
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

				if @player.y < 1
					@player.y = 1
				end

				if @player.y > 455
					@player.y = 455
				end

				if @player.x < 1
					@player.x = 1
				end

				if @player.x > 235
					@player.x = 235
				end
			end
		end
	end
end


