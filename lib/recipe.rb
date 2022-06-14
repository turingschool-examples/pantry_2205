class Recipe
    attr_reader :name, :ingredients_required, :total_calories

    def initialize(name)
        @name = name
        @ingredients_required = {}
        @total_calories = 0
    end

    def add_ingredient(ingredient, qty)
        @ingredients_required.merge!({ingredient => qty}) { |key, oldval, newval| oldval + newval }
    end
end