require './lib/ingredient'
require './lib/recipe'
require 'rspec'

RSpec.describe Recipe do

  it "exists" do
    recipe = Recipe.new("Mac and Cheese")
    expect(recipe).to be_instance_of(Recipe)
  end

  it "can return a recipe's name" do
    recipe =Recipe.new("Mac and Cheese")
    expect(recipe.name).to eq("Mac and Cheese")
  end

  it "can return an empty hash for the initial value of ingredients required" do
    recipe =Recipe.new("Mac and Cheese")
    expect(recipe.ingredients_required).to eq({})
  end

  it "can add ingredients to the ingredients required" do
    recipe1 =Recipe.new("Mac and Cheese")
    expect(recipe1.ingredients_required).to eq({})
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    expect(recipe1.ingredients_required).to eq(ingredient1 => 6)
    recipe1.add_ingredient(ingredient2, 8)
    expect(recipe1.ingredients_required).to eq(ingredient1 => 6, ingredient2 => 8)
  end

  it "can report the total calories of a recipe" do
    recipe1 =Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expect(recipe1.total_calories).to eq(840)
    recipe1.add_ingredient(ingredient1, 2)
    expect(recipe1.total_calories).to eq(1040)

  end
end
