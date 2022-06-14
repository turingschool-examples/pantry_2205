require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require 'pry'

RSpec.describe CookBook do
  let(:pantry) {Pantry.new}
  let(:cookbook) {CookBook.new}
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3) {Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4) {Ingredient.new({name: "Bun", unit: "g", calories: 75})}
  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Cheese Burger")}

  it "exists" do
    expect(cookbook).to be_a CookBook
  end

  it "#add_recipe" do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.recipes).to eq [recipe1, recipe2]
  end

  it "#total_calories" do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    expect(recipe1.total_calories).to eq 440
    expect(recipe2.total_calories).to eq 675
  end

  it "#ingredients" do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    expect(cookbook.ingredients).to eq ["Cheese", "Macaroni", "Ground Beef", "Bun"]
  end

  it "#highest_calorie_meal" do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    expect(cookbook.highest_calorie_meal).to eq recipe2
  end

  it "#enough_ingredients_for" do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq false
  end

end
