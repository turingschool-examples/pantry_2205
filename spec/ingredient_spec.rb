require './lib/helper'

RSpec.describe 'Ingredient' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    
    it 'exists' do
        expect(cheese).to be_instance_of(Ingredient)
    end

    it 'has a name' do
        expect(cheese.name).to eq("Cheese")
    end

    it 'has a unit' do
        expect(cheese.unit).to eq("oz")
    end

    it 'has calories' do
        expect(cheese.calories).to eq(50)
    end
end
