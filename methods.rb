def game_over
	window do
		para "Game over! You're score: #{$points}"
		button("OK") {exit}
	end
end
