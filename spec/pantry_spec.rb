require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe Pantry do
  before :each do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50
      })
    @ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 200
      })
    @pantry = Pantry.new
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end

  it 'has attributes' do
    expect(@pantry.stock).to eq({})
  end

  it 'can check stock if no ingredients are in stock hash' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can restock ingredients' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  xit 'can check to see if there is enough ingredients for' do
    @cookbook = CookBook.new
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
    @ingredient3 = Ingredient.new({
      name: "Ground Beef",
      unit: "oz",
      calories: 100
      })
    @ingredient4 = Ingredient.new({
      name: "Bun",
      unit: "g",
      calories: 75
      })
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 7)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)

    @pantry.restock(@ingredient2, 1)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end
end
