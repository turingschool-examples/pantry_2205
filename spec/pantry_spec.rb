require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
	describe 'Iteration 1' do
		it 'exists' do
			pantry = Pantry.new

			expect(pantry).to be_an_instance_of(Pantry)
		end

		it 'can show the contents of its stock' do
			pantry = Pantry.new
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

			expect(pantry.stock).to eq({})

			pantry.restock(ingredient1, 5)

			expect(pantry.stock.keys.first).to be_a(Ingredient)

		end

		it 'can restock the pantry with an ingredient' do
			pantry = Pantry.new
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

			pantry.restock(ingredient1, 5)

			expect(pantry.stock_check(ingredient1)).to eq(5)

		end

		it 'can check the quantity of an ingredient in stock' do
			pantry = Pantry.new
			ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

			pantry.restock(ingredient1, 5)
			pantry.restock(ingredient1, 10)
			pantry.restock(ingredient2, 7)

			expect(pantry.stock_check(ingredient1)).to eq(15)
			expect(pantry.stock_check(ingredient2)).to eq(7)
			
		end
	end
end
