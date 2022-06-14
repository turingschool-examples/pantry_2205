require './lib/recipe'
require './lib/cook_book'

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
end
