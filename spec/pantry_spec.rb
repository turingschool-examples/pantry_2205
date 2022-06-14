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
end