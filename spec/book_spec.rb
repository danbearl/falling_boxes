require 'spec_helper'

describe Box do
	before :each do
		@box = Box.new
	end

	describe "#new" do
		it "creates a Box object" do
			@box.should be_instance_of(Box)
		end

		it "has random properties" do
			box2 = Box.new
			@box.speed.should_not eql box2.speed
		end
	end

	describe "#x" do
		it "has an x coordinate" do
			@box.x.should_not be_nil
		end
	end

	describe "#y" do
		it "has a y coordinate" do
			@box.y.should_not be_nil
		end
	end

	describe "#width" do
		it "has a width" do
			@box.width.should_not be_nil
		end
	end

	describe "#height" do
		it "has a height" do
			@box.height.should_not be_nil
		end
	end

	describe "#speed" do
		it "has a speed" do
			@box.speed.should_not be_nil
		end
	end

	describe "#collide?" do
		it "can tell if it collides with other objects" do
			obj = Box.new
			obj.x = 10
			obj.y = 10
			@box.x = 10
			@box.y = 10
			@box.collide?(obj).should eql true
		end
	end

	describe "#check" do
		it "should fall one pixel when count = speed." do
			y_before = @box.y
			@box.count = @box.speed - 1
			@box.check

			@box.y.should eql y_before + 1
		end
	end
end
