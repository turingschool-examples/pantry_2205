require './lib/ingredient'
require './lib/pantry'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  it 'exists' do
    expect(@recipe1).to be_a(Recipe)
  end

  it 'has attributes' do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  it 'returns the ingredients required' do
    expect(@recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients to the recipe' do
    expect(@recipe1.ingredients_required).to eq({})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})
  end

  it 'can return the ingredients for a recipe' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
  end

end
