require 'pry'
require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'


describe Recipe do
  before :each do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
  end
  it "exists" do
    expect(@recipe1).to be_a Recipe
  end
  it "has attributes" do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end
  it "starts with an empty ingredients_required hash" do
    expect(@recipe1.ingredients_required).to eq({})
  end
  it "can add ingredients required and their amount" do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required.length).to eq(2)
    expect(@recipe1.ingredients_required[@ingredient1]).to eq(6)
    expect(@recipe1.ingredients_required[@ingredient2]).to eq(8)
  end
  it "can return an array of ingredients" do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients).to be_a Array
    expect(@recipe1.ingredients[0]).to be_a Ingredient
    expect(@recipe1.ingredients.length).to eq(2)
    expect(@recipe1.ingredients[0]).to eq(@ingredient1)
  end
  it "can calculate total calories of a recipe" do

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    expect(@recipe1.total_calories).to eq(440)
    expect(@recipe2.total_calories).to eq(675)
  end
end
