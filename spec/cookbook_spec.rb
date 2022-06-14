require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'
require './lib/pantry'
require 'rspec'

RSpec.describe Cookbook do
  it "exists" do
    cookbook = Cookbook.new
    expect(cookbook).to be_instance_of(Cookbook)
  end

  it "can report the initial empty array of recipes in the cookbook" do
    cookbook = Cookbook.new
    expect(cookbook.recipes).to eq ([])
  end

  it "can add recipes" do
    cookbook = Cookbook.new
    expect(cookbook.recipes).to eq ([])
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    cookbook.add_recipe(recipe1)
    expect(cookbook.recipes).to eq ([recipe1])
    recipe2 = Recipe.new("Cheese Burger")
    cookbook.add_recipe(recipe2)
    expect(cookbook.recipes).to eq ([recipe1, recipe2])
  end

  it "can return an array of all ingredients need for each recipe" do
    cookbook = Cookbook.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    expect(cookbook.ingredients).to eq([])
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it "can return the highest calorie meal" do
    cookbook = Cookbook.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end
  # xit "can return a summary of the cookbook's recipes" do
  #    cookbook = CookBook.new
  #    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
  #    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  #    recipe1 = Recipe.new("Mac and Cheese")
  #    recipe1.add_ingredient(ingredient1, 2)
  #    recipe1.add_ingredient(ingredient2, 8)
  #    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
  #    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
  #    recipe2 = Recipe.new("Burger")
  #    recipe2.add_ingredient(ingredient3, 4)
  #    recipe2.add_ingredient(ingredient4, 100)
  #    cookbook.add_recipe(recipe1)
  #    cookbook.add_recipe(recipe2)
  #    expect(cookbook.summary).to eq([{:name=>"Mac and Cheese",
  #       :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
  #         {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}},
  #         {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef",
  #            :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}],
  #            :total_calories=>500}}])
  # end

  it "can return the date" do
    cookbook = Cookbook.new
    expect(cookbook.date).to eq(Date.today)
  end
end
