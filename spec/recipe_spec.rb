require "rspec"
require "./lib/ingredient"
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

    describe 'Adding ingredients' do
      before :each do
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient1, 4)
        @recipe1.add_ingredient(@ingredient2, 8)
      end

      it "can add ingredients to required" do
        expect(@recipe1.ingredients_required).to eq({@ingredient1=>6, @ingredient2=>8})
      end

      it "can make an array of all ingredients" do
        expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
      end
    end
	end
end
