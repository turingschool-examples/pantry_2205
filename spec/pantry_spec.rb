require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  before(:each) do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end

  it 'has no stock by default' do
    expect(@pantry.stock).to eql({})
  end

  it 'checks the stock for an ingredient' do
    expect(@pantry.stock_check(@ingredient1)).to eql(0)
  end

  it 'checks the stock for an ingredient after restocking' do
    expect(@pantry.stock_check(@ingredient1)).to eql(0)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eql(15)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eql(7)
  end

  it 'checks to see if it has enough ingredients for the recipe' do
    @pantry1 = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100 })
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eql(false)
    @pantry.restock(@ingredient2, 7)
    @pantry.enough_ingredients_for?(@recipe1).to eql(false)
    @pantry.restock(@ingredient2, 1)
    @pantry.enough_ingredients_for?(@recipe1).to eql(true)
  end


end
