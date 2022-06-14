# require './lib/pantry'
require './lib/ingredient'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'exists' do
    expect(@recipe1).to be_a(Recipe)
  end

  it "returns attributes" do
    expect(@recipe1.name).to eq("Mac and Cheese")
    expect(@recipe1.ingredients).to eq({})
  end

  it "can return recipe ingredients" do
    @recipe1.add_ingredient(@ingredient2, 8)
    # require 'pry' ; binding.pry

    expect(@recipe1.ingredients_required.count).to eq(1)
    expect(@recipe1.ingredients.count).to eq(1)
  end


end
