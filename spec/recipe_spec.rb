require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Recipe do
  before do
    @recipe1 = Recipe.new("Mac and Cheese")
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  end

  before do
    @pantry.restock(@ingredient1, 15)
    @pantry.restock(@ingredient2, 10)
  end

  it 'exists and has attributes' do
    expect(@recipe1).to be_a(Recipe)
    expect(@recipe1.name).to eq("Mac and Cheese")
    expect(@recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients with the needed quantity' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)


    expected = {
            @ingredient1 => 6,
            @ingredient2 => 8
           }
    expect(@recipe1.ingredients_required).to eq(expected)
  end

  it 'returns array of current ingredients' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
  end
end