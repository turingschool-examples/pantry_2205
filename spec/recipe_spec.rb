require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Recipe do
  before(:each) do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'exists' do
    expect(@recipe1).to be_a(Recipe)
  end

  it 'has a name' do
    expect(@recipe1.name).to eql("Mac and Cheese")
  end

  it 'has no ingredients required by default' do
    expect(@recipe1.ingredients_required).to eql({})
  end

  it 'finds ingredients and amounts required' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required).to eql({@ingredient1=>6, @ingredient2=>8})
  end

  it 'finds ingredients required' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to eql([@ingredient1, @ingredient2])
  end

  it 'calculates the total calories of a recipe' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100 })
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    expect(@recipe1.total_calories).to eql(440)
    expect(@recipe2.total_calories).to eql(675)
  end

end
