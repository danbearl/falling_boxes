require 'spec_helper'

describe Player do
	before :each do
		@player = Player.new
	end

	describe "#new" do
		it "creates a Player object" do
			@player.should be_an_instance_of Player
		end
	end

	describe "#x" do
		it "has an x coordinate" do
			@player.x.should_not be_nil
		end
	end

	describe "#y" do
		it "has a y coordinate" do
			@player.y.should_not be_nil
		end
	end

	describe "#move" do
		it "decreases the x coordinate when passed :left" do
			x_before = @player.x
			@player.move(:left)
			@player.x.should eql x_before - 5	
		end

		it "increases the x coordinate when passed :right" do
			x_before = @player.x
			@player.move(:right)
			@player.x.should eql x_before + 5
		end

		it "decreases the y coordinate when passed :up" do
			y_before = @player.y
			@player.move(:up)
			@player.y.should eql y_before - 5
		end

		it "increases the y coordinate when passed :down" do
			y_before = @player.y
			@player.move(:down)
			@player.y.should eql y_before + 5
		end
	end
end
