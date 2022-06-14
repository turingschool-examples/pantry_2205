require './lib/helper'

RSpec.describe Recipe do

  before do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    @recipe1 = Recipe.new("Mac and Cheese")
  end

  it 'can name recipe' do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  it 'can return empty hash of required ingredients'do
    expect(@recipe1.ingredients_required).to eq({})
  end

  it 'can add required ingredients to hash and return hash' do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})

    expect(@recipe1.ingredients).to eq(["Cheese", "Macaroni"])

  end

end
