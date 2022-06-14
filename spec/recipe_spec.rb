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
end
