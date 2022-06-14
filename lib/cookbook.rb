require 'pry'

class CookBook
    attr_reader :recipes
    def initialize
        @recipes = []
    end

    def add_recipe(recipe)
        @recipes << recipe
    end

    def ingredients
       @recipes.flat_map do |recipe|
         recipe.ingredients_required.map do |ingredient, quantity|
            ingredient.name
         end
        end.uniq
    end

    def highest_calorie_meal
        @recipes.max_by do |recipe|
            recipe.total_calories
        end
    end
end