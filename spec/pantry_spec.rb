require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Pantry do
  before :each do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'initialize pantry' do
    expect(@pantry).to be_instance_of Pantry
  end

  it 'stock default is empty hash' do
    expect(@pantry.stock).to eq({})
  end

  it 'pantry can check stock on ingredient' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can restock ingredients and add new ingredient amounts' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
  end

  it 'can add stock to additional ingredients' do
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  xit 'returns if there is enought ingredients recipe' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
  end

end
