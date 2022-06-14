require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'
require 'pry'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'is a Pantry' do
    expect(@pantry).to be_instance_of Pantry
  end

  it 'has no stock by default' do
    expect(@pantry.stock).to eq({})
  end

  it 'can check its stock for an ingredient' do
    expect(@pantry.stock_check(@ingredient1)).to eq 0
  end

  it 'can restock an ingredient' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient1)).to eq 15
    expect(@pantry.stock_check(@ingredient2)).to eq 7
  end

  describe 'iteration 3' do
    before :each do
      @pantry = Pantry.new
      @cookbook = CookBook.new

      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)

      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

      @recipe2 = Recipe.new("Cheese Burger")
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)

      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
    end

    it 'can tell if the Pantry has enough ingredients for a Recipe' do
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq false
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq false
      @pantry.restock(@ingredient2, 1)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq true
    end
  end
end
