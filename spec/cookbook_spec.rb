require './lib/helper'

RSpec.describe 'Cookbook' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:mac) { Recipe.new("Mac and Cheese") }
    let!(:burger) { Recipe.new("Cheese Burger") }
    let!(:cookbook) { Cookbook.new }

    it 'exists' do
        expect(cookbook).to be_instance_of(Cookbook)
    end

    it 'has recipes' do
        expect(cookbook.recipes).to eq([])
    end

    it 'can add recipes' do
        cookbook.add_recipe(mac)
        expect(cookbook.recipes).to eq([mac])
        cookbook.add_recipe(burger)
        expect(cookbook.recipes).to eq([mac, burger])
    end
end