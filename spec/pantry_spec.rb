require './lib/ingredient'
require './lib/pantry'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
    @cookbook = CookBook.new
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'it is an instance of pantry' do
    expect(@pantry).to be_instance_of Pantry
  end

  it 'it can display what it has in stock' do
    expect(@pantry.stock).to eq({})
  end

  it 'it can check what ingredients it has in stock' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'is can restock ingredients' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  it 'is can see if you have enough ingredients for a recipe' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
    @pantry.restock(@ingredient2, 1)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end


end
