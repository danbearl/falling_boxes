require 'spec_helper'

describe Candy do
	before :each do
		@candy = Candy.new
	end

	describe "#new" do
		it "creates a Candy object" do
			@candy.should be_an_instance_of Candy
		end
	end
end
