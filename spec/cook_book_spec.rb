require './lib/recipe'
require './lib/cook_book'
require './lib/ingredient'

RSpec.describe CookBook do
  it 'exists' do
    cookbook = CookBook.new
    expect(cookbook).to be_a(CookBook)
  end

  it 'has recipes' do
    cookbook = CookBook.new
    expect(cookbook.recipes).to eq([])
  end

  it 'can add recipes' do
    cookbook = CookBook.new
    expect(cookbook.recipes).to eq([])

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end

  it 'can return all ingredients' do
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    cookbook.add_recipe(recipe1)
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2 = Recipe.new("Cheese Burger")
    cookbook.add_recipe(recipe2)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it 'can return meal with highest calories' do
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    cookbook.add_recipe(recipe1)
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2 = Recipe.new("Cheese Burger")
    cookbook.add_recipe(recipe2)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end
end
