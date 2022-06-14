require './lib/helper'

RSpec.describe 'Recipe' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:mac) { Recipe.new("Mac and Cheese") }

    it 'exists' do
        expect(mac).to be_instance_of(Recipe)
    end 
end