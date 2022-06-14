require './lib/helper'

RSpec.describe 'Pantry' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:c_cheese) { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:less_macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 30}) }
    let!(:beef) { Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100}) }
    let!(:bun) { Ingredient.new({name: "Bun", unit: "g", calories: 75}) }
    let!(:mac) { Recipe.new("Mac and Cheese") }
    let!(:burger) { Recipe.new("Cheese Burger") }
    let!(:pantry) { Pantry.new }

    it 'exists' do
        expect(pantry).to be_instance_of(Pantry)
    end

    it 'has stock' do
        expect(pantry.stock).to eq({})
    end
    
    it 'can check stock' do
        expect(pantry.stock).to eq({})
        expect(pantry.stock_check(cheese)).to eq(nil)
    end
    
    it 'can stock ingredients' do
        expect(pantry.stock).to eq({})
        expect(pantry.stock_check(cheese)).to eq(nil)
        pantry.restock(cheese, 5)
        expect(pantry.stock_check(cheese)).to eq(5)
        pantry.restock(cheese, 10)
        expect(pantry.stock_check(cheese)).to eq(15)
    end

    it 'can tell if there are enough ingredients to make a recipe' do
        mac.add_ingredient(c_cheese, 2)
        mac.add_ingredient(less_macaroni, 8)
        expect(mac.ingredients_required).to eq({c_cheese => 2, less_macaroni => 8})
        burger.add_ingredient(c_cheese, 2)
        burger.add_ingredient(beef, 4)
        burger.add_ingredient(bun, 1)
        expect(burger.ingredients_required).to eq({c_cheese => 2, beef => 4, bun => 1})   
        expect(pantry.enough_ingredients?(mac)).to eq(false)
        pantry.restock(c_cheese, 5)
        pantry.restock(c_cheese, 10)
        expect(pantry.enough_ingredients?(mac)).to eq(false)
        pantry.restock(less_macaroni, 7)
        expect(pantry.enough_ingredients?(mac)).to eq(false)
        pantry.restock(less_macaroni, 1)
        expect(pantry.enough_ingredients?(mac)).to eq(true)
    end
end