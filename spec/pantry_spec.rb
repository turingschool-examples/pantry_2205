require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require 'rspec'

RSpec.describe Pantry do

    it "exists" do
      pantry = Pantry.new
      expect(pantry).to be_instance_of(Pantry)
    end

    it "can report an initial empty stock" do
      pantry = Pantry.new
      expect(pantry.stock).to eq({})
    end

    it "can report stock count of a specific ingredient" do
      pantry = Pantry.new
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      expect(pantry.stock_check(ingredient1)).to eq(0)
    end

    it "can restock a particular ingredient" do
      pantry = Pantry.new
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
      expect(pantry.stock_check(ingredient1)).to eq(0)
      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)
      expect(pantry.stock_check(ingredient1)).to eq(15)
      expect(pantry.stock_check(ingredient2)).to eq(0)
      pantry.restock(ingredient2, 7)
      expect(pantry.stock_check(ingredient2)).to eq(7)
    end

    it "can return if it has enough ingredients for an item?" do
      pantry = Pantry.new
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
      recipe1 =Recipe.new("Mac and Cheese")
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient1, 4)
      recipe1.add_ingredient(ingredient2, 8)
      pantry.restock(ingredient1, 5)
      expect(pantry.enough_ingredients_for?(recipe1)).to eq(FALSE)
      recipe2 = Recipe.new("Hamburger")
      ingredient3 = Ingredient.new({name: "Ground beef", unit: "oz", calories: 200})
      ingredient4 = Ingredient.new({name: "Bun", unit: "bun", calories: 100})
      recipe2.add_ingredient(ingredient3, 1)
      recipe2.add_ingredient(ingredient4, 1)
      pantry.restock(ingredient3, 1)
      pantry.restock(ingredient4, 1)
      expect(pantry.enough_ingredients_for?(recipe2)).to eq(TRUE)
    end

end
