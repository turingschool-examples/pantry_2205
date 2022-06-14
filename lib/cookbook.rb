class Cookbook
    attr_reader :recipes, :date

    def initialize
        @recipes = []
        @date = Date.today.strftime("%m-%d-%Y")
    end

    def add_recipe(recipe)
        @recipes << recipe
    end

    def ingredients
        @recipes.map {|recipe| recipe.ingredient_names}.flatten.uniq
    end

    def highest_calorie_meal
        @recipes.max_by {|recipe| recipe.total_calories}
    end
end