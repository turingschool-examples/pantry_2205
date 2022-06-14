require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/pantry'


RSpec.describe CookBook do
  it "exists" do
    cookbook = CookBook.new
    expect(cookbook).to be_a CookBook
  end

  it "has recipes" do
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    expect(cookbook.recipes).to eq([])
  end

  it "can add recipes" do
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end

  it "list all the ingredients in the cookbook" do
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    cookbook.add_recipe(recipe1)
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it "finds the highest calorie meal" do
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end

  xit 'creates a summary of all recipes' do
    cookbook = CookBook.new
    cookbook.add_recipe("mac_and_cheese")
    cookbook.add_recipe("burger")
    expected = [
      {
        name: "Mac and Cheese",
        details: {
          ingredients: [
            {ingredient: "Macaroni", amount: "8 oz"},
            {ingredient: "Cheese", amount: "2 C"}
          ],
          total_calories: 440
        }
      },
      {
      name: "Burger",
      details: {
        ingredients: [
          {ingredient: "Ground Beef", amount: "4 oz"},
          {ingredient: "Bun", amount: "100 g"}
        ],
        total_calories: 500
        }
      }
    ]
    expect(cookbook.summary).to eq expected
  end
end
