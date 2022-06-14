class Recipe
    attr_reader :name, :ingredients_required

    def initialize(name)
        @name = name
        @ingredients_required = {}
    end

    def add_ingredient(ingredient, qty)
        @ingredients_required.merge!({ingredient => qty}) { |key, oldval, newval| oldval + newval }
    end
end