require './lib/ingredient'

RSpec.describe Ingredient do
  describe '#initialize' do
    it 'exists' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

      expect(ingredient1).to be_instance_of(Ingredient)
    end
  end

  describe '@name' do
    it 'has a name' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

      expect(ingredient1.name).to eq("Cheese")
    end
  end

  describe '@unit' do
    it 'has a unit' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    expect(ingredient1.unit).to eq("oz")
    end
  end

  describe '@calories' do
    it 'has calories' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

      expect(ingredient1.calories).to eq(50)
    end
  end
end
