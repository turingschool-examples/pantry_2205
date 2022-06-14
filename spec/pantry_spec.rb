require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'

RSpec.describe Pantry do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    @pantry = Pantry.new

    recipe1 = Recipe.new("Mac and Cheese")

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
  end

  it 'is an instance of a pantry' do
    expect(@pantry).to be_a Pantry
  end

  it 'has no stock by default' do
    expect(@pantry.stock).to eq ({})
  end

  it 'can check its stock' do
    expect(@pantry.stock_check(@ingredient1)).to eq 0
  end

  it 'restock ingredients' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.stock_check(@ingredient1)).to eq 15

    @pantry.restock(@ingredient2, 7)

    expect(@pantry.stock_check(@ingredient2)).to eq 7
  end

  it 'knows if has enough engredients' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq false

    @pantry.restock(@ingredient2, 7)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq false

    @pantry.restock(@ingredient2, 1)

    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq true
  end

end
