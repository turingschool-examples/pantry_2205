require "rspec"
require "./lib/ingredient"
# require "./lib/pantry"
require "./lib/recipe"

RSpec.describe Recipe do
	describe "Iteration 2" do
		before :each do
			@ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
      @recipe1 = Recipe.new("Mac and Cheese")
		end

		it "exists" do
			expect(@recipe1).to be_a(Recipe)
		end

		it "has a name, and starts with an empty hash for ingredients" do
			expect(@recipe1.name).to eq(("Mac and Cheese"))
      expect(@recipe1.ingredients_required).to eq({})
    end
	end
end
