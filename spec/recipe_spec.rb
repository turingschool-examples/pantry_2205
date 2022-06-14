require './lib/recipe'
# require './lib/pantry'
require './lib/ingredient'
require 'rspec'
require 'pry'

RSpec.describe Recipe do
  before(:each) do
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  end

  it "exist" do
    expect(@recipe1).to be_a(Recipe)
  end

  it " has meal name" do
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  it "has a default ingredient list of empty hash" do
    expect(@recipe1.ingredients_required).to eq({})
  end

  it "can add ingredients" do
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 =>8})
    expect(@recipe1.ingredients).to eq({@ingredient1 => 6, @ingredient2 =>8})
  end

  it "can add all the calories in recipe" do
    @recipe1.add_ingredient(@ingredient1, 6)
    expect(@recipe1.ingredients_total_calories(@ingredient1, 6)).to eq(600)
  end

  it "can add all the calories in recipe" do
    @recipe1.add_ingredient(@ingredient1, 6)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@recipe1.total_calories(@recipe1)).to eq(840)
  end
end
