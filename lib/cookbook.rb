require 'time'
class CookBook

    attr_reader :recipes, :ingredients, :date

    def initialize
        @recipes = []
        @ingredients = []
        @date = Date.today.strftime("%m-%d-%Y")
    end

    def add_recipe(recipe)
        @recipes << recipe
        @ingredients << recipe.ingredients.map{|ing| ing.name}
        @ingredients.flatten!.uniq!
    end

    def highest_calorie_meal
        @recipes.max{ |recipe| recipe.total_calories }
    end

    def summary
        return_array = []
        recipes.each do |recipe| 
            return_array << recipe_hash(recipe)
        end
        return_array
    end
    def recipe_hash(recipe)
        r_hash = {}
        r_hash[:name] = recipe.name
        r_hash[:details] = recipe.ingredients_by_calories
        r_hash
    end
end