require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
    before(:each) do
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
        @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
        @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
    end

    it '1. exists' do
        expect(@recipe1).to be_a Recipe
    end

    it '2. has any name' do
        expect(@recipe1.name).to eq "Mac and Cheese"
        expect(@recipe2.name).to eq "Cheese Burger"
    end

    it '3. has a hash of ingredients required' do
        expect(@recipe1.ingredients_required).to eq({})
    end

    it '4. has add ingredient method which takes ingedients and the qty' do
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient1, 4)
        @recipe1.add_ingredient(@ingredient2, 8)
        expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})
    end

    it '5. can return just the ingredients' do
        @recipe1.add_ingredient(@ingredient1, 15)
        @recipe1.add_ingredient(@ingredient2, 10)
        expect(@recipe1.ingredients).to eq [@ingredient1, @ingredient2]
    end

    it '6. can calculate total calories' do
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)

        expect(@recipe1.total_calories).to eq 440
        expect(@recipe2.total_calories).to eq 675
    end

    it '7. can return of hash for the summary ' do
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
        
        expect(@recipe2.ingredients_by_calories).to eq({:ingredients=>[{:amount=>"4 oz", :ingredient=>"Ground Beef"}, {:amount=>"2 C", :ingredient=>"Cheese"}, {:amount=>"1 g", :ingredient=>"Bun"}], :total_calories=>675})
    end
end