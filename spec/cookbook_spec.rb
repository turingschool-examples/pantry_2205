require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cookbook'

RSpec.describe CookBook do
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
    @cookbook = CookBook.new
  end

  it 'exists' do
    expect(@cookbook).to be_a(CookBook)
  end

  it 'has a recipes array' do
    expect(@cookbook.recipes).to eq([])
  end
end
