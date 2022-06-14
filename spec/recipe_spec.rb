require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'exists' do
    expect(@recipe1).to be_a(Recipe)
  end

  it 'has a name' do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  it 'starts w empty ingredients required' do
    expect(@recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients required' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required).to eq({ @ingredient1 => 6, @ingredient2 => 8 })
  end

  it 'can list ingredients' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
  end
end
