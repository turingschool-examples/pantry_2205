require 'rspec'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cookbook'

RSpec.describe CookBook do

  before(:each) do
    @ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50})

    @ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 200})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @cookbook = CookBook.new
  end

  it 'exists' do
    expect(@cookbook).to be_instance_of(CookBook)
  end

end
