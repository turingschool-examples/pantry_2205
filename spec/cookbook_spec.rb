require "rspec"
require "./lib/recipe"
require "./lib/cookbook"

RSpec.describe CookBook do
	describe "Iteration 2" do
		before :each do
      @recipe1 = Recipe.new("Mac and Cheese")
			@recipe2 = Recipe.new("Cheese Burger")
      @cookbook = CookBook.new
		end

		it "exists" do
			expect(@cookbook).to be_a(CookBook)
		end

		it "starts with no recipes" do
			expect(@cookbook.recipes).to eq([])
    end
	end
end
