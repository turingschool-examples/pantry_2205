require './lib/cookbook'
require './lib/recipe'
# require './lib/pantry'
require './lib/ingredient'
require 'rspec'
require 'pry'

RSpec.describe CookBook do
  before(:each) do
    @cookbook = CookBook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    # Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    # Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  end

  it "exist" do
    expect(@cookbook).to be_a(CookBook)
  end

  it "has an empty hash of recipes to start" do
    expect(@cookbook.recipes).to eq([])
  end

  it "can add recipe" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end


end
