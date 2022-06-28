require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe Pantry do
  it 'exists' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry).to be_a Pantry
  end

  it 'can contain stock' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock).to eq({})
    expect(pantry.stock_check(ingredient1)).to eq(0)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    expect(pantry.stock_check(ingredient1)).to eq(15)

    pantry.restock(ingredient2, 7)

    expect(pantry.stock_check(ingredient2)).to eq(7)
  end

  it 'checks to see if there is enough stock' do
    pantry = Pantry.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    expect(pantry.enough_ingredients_for?(recipe1)).to be false

    pantry.restock(ingredient2, 7)

    expect(pantry.enough_ingredients_for?(recipe1)).to be false

    pantry.restock(ingredient2, 1)

    expect(pantry.enough_ingredients_for?(recipe1)).to be true
  end
end
