require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
	describe 'Iteration 2' do
		it 'exists' do
			recipe1 = Recipe.new("Mac and Cheese")

			expect(recipe1).to be_an_instance_of(Recipe)
		end

		it 'returns the recipe name' do
			recipe1 = Recipe.new("Mac and Cheese")

			expect(recipe1.name).to eq("Mac and Cheese")
		end

		it 'returns the ingredients required' do
			recipe1 = Recipe.new("Mac and Cheese")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

			expect(recipe1.ingredients_required).to eq({})

			recipe1.add_ingredient(ingredient1, 2)
			recipe1.add_ingredient(ingredient1, 4)
			recipe1.add_ingredient(ingredient2, 8)

			expect(recipe1.ingredients_required.keys.first).to be_a(Ingredient)
			expect(recipe1.ingredients_required.values.first).to eq(6)
		end

		it 'adds ingredients to the recipe' do
			recipe1 = Recipe.new("Mac and Cheese")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})


			recipe1.add_ingredient(ingredient1, 2)

			expect(recipe1.ingredients_required.keys.first).to eq(ingredient1)
		end

		it 'will return a list of ingredients' do
			recipe1 = Recipe.new("Mac and Cheese")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

			recipe1.add_ingredient(ingredient1, 2)
			recipe1.add_ingredient(ingredient1, 4)
			recipe1.add_ingredient(ingredient2, 8)

			expect(recipe1.ingredients).to eq([ingredient1, ingredient2])			
		end
	end
end
