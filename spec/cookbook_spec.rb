require './lib/helper'

RSpec.describe 'Cookbook' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:mac) { Recipe.new("Mac and Cheese") }
    let!(:cookbook) { Cookbook.new }

    it 'exists' do
        expect(cookbook).to be_instance_of(Cookbook)
    end
end