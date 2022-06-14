require './lib/ingredient'

RSpec.describe Ingredient do
	describe 'Iteration 1' do
		it 'exists' do
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

			expect(ingredient1).to be_an_instance_of(Ingredient)
		end

		it 'returns the ingredient name' do
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

			expect(ingredient1.name).to eq("Cheese")
		end

		it 'returns the ingredient unit' do
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

			expect(ingredient1.unit).to eq("oz")
		end

		it 'returns the ingredient calories' do
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

			expect(ingredient1.calories).to eq(50)
		end
	end
end
