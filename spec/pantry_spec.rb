require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Pantry do
    before(:each) do
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
        @pantry = Pantry.new
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
    end

    it '1. exists' do
        expect(@pantry).to be_a Pantry
    end

    it '2. has stock' do
        expect(@pantry.stock).to eq({})
    end

    it '3. can return stock of a specific item' do
        expect(@pantry.stock_check(@ingredient1)).to eq 0
    end

    it '4. has restock class which takes ingedients and the qty' do
        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)
        expect(@pantry.stock_check(@ingredient1)).to eq 15
    end

    it '5. can stock multiple items' do
        @pantry.restock(@ingredient1, 15)
        @pantry.restock(@ingredient2, 10)
        expect(@pantry.stock_check(@ingredient1)).to eq 15
        expect(@pantry.stock_check(@ingredient2)).to eq 10
    end

    it '6. can return true if the pantry holds ingredients for recipe' do
        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)
        expect(@pantry.enough_ingredients_for?(@recipe1)).to be false

        @pantry.restock(@ingredient2, 7)
        expect(@pantry.enough_ingredients_for?(@recipe1)).to be false

        @pantry.restock(@ingredient2, 1)
        expect(@pantry.enough_ingredients_for?(@recipe1)).to be true
    end
end