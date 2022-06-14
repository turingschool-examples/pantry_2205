require './lib/ingredient'
require './lib/pantry'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe CookBook do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  it 'exists' do
    expect(@cookbook).to be_a(CookBook)
  end

  it 'can have recipes' do
    expect(@cookbook.recipes).to eq([])
  end

  it 'can add recipes' do
    expect(@cookbook.recipes).to eq([])
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end
end
