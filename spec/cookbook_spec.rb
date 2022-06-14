require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'
require 'time'

RSpec.describe CookBook do
    before(:each) do
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
        @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
        @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @cookbook = CookBook.new

        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
    end

    it '1. exists' do
        expect(@cookbook).to be_a CookBook
    end

    it '2. has an array of recipes' do
        expect(@cookbook.recipes).to eq([])
    end

    it '3. has add recipe method which takes a recipe' do
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
    end

    it '4. has an array of ingredient names from recipes' do
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it '5. can return the highest calorie meal' do
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
    end

    it '6. has a date when it was made' do
        expect(@cookbook.date).to eq Date.today.strftime("%m-%d-%Y")
    end

    it 'provides a summary' do
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        expect(@cookbook.summary).to be_a Array
        expect(@cookbook.summary[1][:name]).to eq "Cheese Burger"
        expect(@cookbook.summary[1][:details][:ingredients]).to eq([{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:amount=>"2 oz", :ingredient=>"Cheese"}, {:ingredient=>"Bun", :amount=>"1 g"}])
    end
end