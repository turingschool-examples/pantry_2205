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

	describe 'Iteration 3' do

		it 'can return the total calories' do
			recipe1 = Recipe.new("Mac and Cheese")
			recipe2 = Recipe.new("Cheese Burger")
			ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
			ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
			ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
			ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

			recipe1.add_ingredient(ingredient1, 2)
			recipe1.add_ingredient(ingredient2, 8)
			recipe2.add_ingredient(ingredient1, 2)
			recipe2.add_ingredient(ingredient3, 4)
			recipe2.add_ingredient(ingredient4, 1)

			expect(recipe1.total_calories).to eq(440)
			expect(recipe2.total_calories).to eq(675)

		end
		
	end
end
