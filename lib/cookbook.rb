class Cookbook
    attr_reader :recipes

    def initialize
        @recipes = []
    end

    def add_recipe(recipe)
        @recipes << recipe
    end

    def ingredients
        @recipes.map {|recipe| recipe.ingredient_names}.flatten.uniq
    end
end