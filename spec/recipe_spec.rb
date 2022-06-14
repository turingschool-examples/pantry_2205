require './lib/helper'

RSpec.describe 'Recipe' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:c_cheese) { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:less_macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 30}) }
    let!(:mac) { Recipe.new("Mac and Cheese") }

    it 'exists' do
        expect(mac).to be_instance_of(Recipe)
    end 

    it 'has a name' do
        expect(mac.name).to eq("Mac and Cheese")
    end

    it 'has required ingredients' do
        expect(mac.ingredients_required).to eq({})
    end

    it 'can add ingredients' do
        mac.add_ingredient(cheese, 2)
        mac.add_ingredient(cheese, 4)
        mac.add_ingredient(macaroni, 8)
        expect(mac.ingredients_required).to eq({cheese => 6, macaroni => 8})
    end

    it 'has a total calories' do
        mac.add_ingredient(c_cheese, 2)
        mac.add_ingredient(less_macaroni, 8)
        expect(mac.total_calories).to eq(440)
    end
end