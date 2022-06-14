require './lib/helper'

RSpec.describe 'Ingredient' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    
    it 'exists' do
        expect(cheese).to be_instance_of(Ingredient)
    end

    it 'has a name' do
        expect(cheese.name).to eq("Cheese")
    end
end
