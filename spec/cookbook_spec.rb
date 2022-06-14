require './lib/helper'

RSpec.describe CookBook do

  it 'can add recipe and return recipes' do

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    cookbook = CookBook.new


    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.recipes).to eq(["Mac and Cheese", "Cheese Burger"])
  end

  it 'can find ingredients for multiple recipes' do
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    cookbook = CookBook.new
    

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])

  end

end
