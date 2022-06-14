require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'

RSpec.describe CookBook do

  let(:cookbook) { CookBook.new }

  let(:recipe1) { Recipe.new("Mac and Cheese") }
  let(:recipe2) { Recipe.new("Cheese Burger") }

  let(:ingredient1)  { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
  let(:ingredient2) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 30}) }
  let(:ingredient3) { Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100}) }
  let(:ingredient4) { Ingredient.new({name: "Bun", unit: "g", calories: 75}) }

  it "exists" do
    expect(cookbook).to be_a(CookBook)
  end

  it "has attributes" do
    expect(cookbook.recipes).to eq([])
  end

  it "can add recipes" do
    expect(cookbook.recipes).to eq([])

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end

  it "can return a list of ingredients" do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it "can return the highest calorie meal" do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end

  it "can return a summery of recipes" do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.summary).to eq([{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}])#need to do expected statement
  end
end
