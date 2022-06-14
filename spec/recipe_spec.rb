require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe Recipe do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'exists and has name, no ingredients' do
    expect(@recipe1).to be_a(Recipe)
    expect(@recipe1.name).to eq("Mac and Cheese")
    expect(@recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required.length).to eq(2)
    expect(@recipe1.ingredients_required.keys).to eq([@ingredient1, @ingredient2])
    expect(@recipe1.ingredients_required.values).to eq([6, 8])
  end

  it 'can track ingredients' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
  end
end
