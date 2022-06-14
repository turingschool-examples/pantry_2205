require './lib/helper'

RSpec.describe 'Cookbook' do
    let!(:cheese) { Ingredient.new({name: "Cheese", unit: "oz", calories: 50}) }
    let!(:c_cheese) { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
    let!(:macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:less_macaroni) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 30}) }
    let!(:beef) { Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100}) }
    let!(:bun) { Ingredient.new({name: "Bun", unit: "g", calories: 75}) }
    let!(:mac) { Recipe.new("Mac and Cheese") }
    let!(:burger) { Recipe.new("Cheese Burger") }
    let!(:cookbook) { Cookbook.new }

    it 'exists' do
        expect(cookbook).to be_instance_of(Cookbook)
    end

    it 'has recipes' do
        expect(cookbook.recipes).to eq([])
    end

    it 'can add recipes' do
        cookbook.add_recipe(mac)
        expect(cookbook.recipes).to eq([mac])
        cookbook.add_recipe(burger)
        expect(cookbook.recipes).to eq([mac, burger])
    end

    it 'can list ingredients' do
        expect(cookbook.ingredients).to eq([])
        mac.add_ingredient(c_cheese, 2)
        mac.add_ingredient(less_macaroni, 8)
        cookbook.add_recipe(mac)
        burger.add_ingredient(c_cheese, 2)
        burger.add_ingredient(beef, 4)
        burger.add_ingredient(bun, 1)
        cookbook.add_recipe(burger)
        expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it 'can list highest calorie meal' do
        expect(cookbook.highest_calorie_meal).to eq(nil)
        mac.add_ingredient(c_cheese, 2)
        mac.add_ingredient(less_macaroni, 8)
        cookbook.add_recipe(mac)
        burger.add_ingredient(c_cheese, 2)
        burger.add_ingredient(beef, 4)
        burger.add_ingredient(bun, 1)
        cookbook.add_recipe(burger)
        expect(cookbook.highest_calorie_meal).to eq(burger)
    end

    it 'has a published date' do
        expect(cookbook.date).to eq("06-14-2022")
    end
    
    it 'can list a recipe summary in order of calories' do
        mac.add_ingredient(c_cheese, 2)
        mac.add_ingredient(less_macaroni, 8)
        cookbook.add_recipe(mac)
        burger.add_ingredient(c_cheese, 2)
        burger.add_ingredient(beef, 4)
        burger.add_ingredient(bun, 1)
        cookbook.add_recipe(burger)
        expect(cookbook.summary).to eq([{
            :name=>"Mac and Cheese", 
            :details=>{
                :ingredients=>[{
                    :ingredient=>"Macaroni", 
                    :amount=>"8 oz"}, 
                    {:ingredient=>"Cheese", 
                    :amount=>"2 C"}], 
                :total_calories=>440
            }}, 
            {:name=>"Burger", 
            :details=>{
                :ingredients=>[{
                    :ingredient=>"Ground Beef", 
                    :amount=>"4 oz"}, 
                    {:ingredient=>"Bun", 
                    :amount=>"100 g"
                }], 
                :total_calories=>500
        }}])
    end
end