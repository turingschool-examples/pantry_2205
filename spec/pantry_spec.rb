require './lib/helper'

RSpec.describe 'Pantry' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:pantry) { Pantry.new }

    it 'exists' do
        expect(pantry).to be_instance_of(Pantry)
    end

    it 'has stock' do
        expect(pantry.stock).to eq({})
    end
end