require 'rspec'
require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe CookBook do
	before :each do
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
	end

  it 'exists' do
    expect(@cookbook).to be_a(CookBook)
  end

  it 'can add recipes' do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end
end
