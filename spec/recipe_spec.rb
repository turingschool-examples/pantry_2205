require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  it 'exists' do
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1).to be_a(Recipe)
  end

  it 'has attributes' do
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1.name).to eq("Mac and Cheese")
    expect(recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients' do
    recipe1 = Recipe.new("Mac and Cheese")
    expect(recipe1.ingredients_required).to eq({})

    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expect(recipe1.ingredients_required).to eq({ingredient1 => 6, ingredient2 => 8})
  end
end
