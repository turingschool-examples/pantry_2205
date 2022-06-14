require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do
  describe '#initialize' do
    it 'exists' do
      pantry = Pantry.new

      expect(pantry).to be_instance_of(Pantry)
    end
  end

  describe '@stock' do
    it 'has empty stock' do
      pantry = Pantry.new

      expect(pantry.stock).to eq({})
    end
  end

  describe '#stock check' do
    it 'can check stock of an item' do
      pantry = Pantry.new
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

      expect(pantry.stock_check(ingredient1)).to eq(0)
    end
  end

  describe '#restock' do
    it 'can stock items' do
      pantry = Pantry.new
      ingredient1 = ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)

      expect(pantry.stock_check(ingredient1)).to eq(15)

    end
  end
end
