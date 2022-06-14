require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  let(:pantry) {Pantry.new}

  let(:cookbook) {Cookbook.new}

  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Cheese Burger")}

  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "oz", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3) {Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4) {Ingredient.new({name: "Bun", unit: "g", calories: 75})}

  it "exists" do
    expect(pantry).to be_an(Pantry)
  end

  it "has attributes" do
    expect(pantry.stock).to eq({})
  end

  it "can check the stock" do
    expect(pantry.stock).to eq({})
    expect(pantry.stock_check(ingredient1)).to eq(0)
  end

  it "can restcok items" do
    expect(pantry.stock).to eq({})
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check(ingredient1)).to eq(15)
    pantry.restock(ingredient2, 7)
    expect(pantry.stock_check(ingredient2)).to eq(7)
  end

  it "can check if it has enough ingredients to make a recipe" do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expect(recipe1.ingredients_required).to eq({
      ingredient1 => 6,
      ingredient2 => 8
      })
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 7)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 1)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
  end

end
