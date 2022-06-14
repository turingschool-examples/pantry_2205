require "rspec"
require "./lib/ingredient"
require "./lib/pantry"
# require "./lib/recipe"

RSpec.describe Pantry do
	describe "Iteration 1" do
		before :each do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
      @pantry = Pantry.new
    end

		it "exists" do
			expect(@pantry).to be_a(Pantry)
		end

		it "can start with an empty stock hash" do
			expect(@pantry.stock).to eq({})
    end

    it "can check stock of ingredients (starts at 0)" do
      expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end

    it "can restock ingredients" do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)

      expect(@pantry.stock_check(@ingredient1)).to eq(15)
      expect(@pantry.stock).to eq({@ingredient1=>15})

      @pantry.restock(@ingredient2, 7)

      expect(@pantry.stock_check(@ingredient2)).to eq(7)
      expect(@pantry.stock).to eq({@ingredient1=>15, @ingredient2=>7})
    end
  end

  describe 'iteration 3' do
    before :each do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
    end

    it "can tell if there are enough items for a recipe" do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)

      expect(@pantry.enough_ingredients_for?(@recipe1)).to be(false)

      @pantry.restock(@ingredient2, 7)

      expect(@pantry.enough_ingredients_for?(@recipe1)).to be(false)

      @pantry.restock(@ingredient2, 1)

      expect(@pantry.enough_ingredients_for?(@recipe1)).to be(true)
    end
	end
end
