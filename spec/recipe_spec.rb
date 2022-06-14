require 'rspec'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Recipe do

  before(:each) do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50})

    @ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 200})

    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'exists' do
    expect(@recipe1).to be_instance_of(Recipe)
  end

  it 'returns name' do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  it 'initializes with empty hash for ingredients required' do
    expect(@recipe1.ingredients_required).to eq({})
  end

end
