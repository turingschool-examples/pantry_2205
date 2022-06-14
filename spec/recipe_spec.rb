require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "C",
      calories: 100
      })
    @ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 30
      })
    @pantry = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'exists' do
    expect(@recipe1).to be_a(Recipe)
    expect(@recipe2).to be_a(Recipe)
  end

  it 'has attributes' do
    expect(@recipe1.name).to eq("Mac and Cheese")
    expect(@recipe2.name).to eq("Cheese Burger")
  end

  it 'can add ingredients to recipe' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required).to eq(@ingredient1 => 6, @ingredient2 => 8)
  end
end
