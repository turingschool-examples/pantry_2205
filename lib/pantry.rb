class Pantry

    attr_reader :stock

    def initialize
        @stock = Hash.new(0)
    end

    def stock_check(ingredient)
        @stock[ingredient]
    end

    def restock(ingredient, qty)
        @stock[ingredient] += qty
    end

    def enough_ingredients_for?(recipe)
        short_ingredients = recipe.ingredients_required.select {|ingredient, qty| qty > @stock[ingredient]}
        short_ingredients.length == 0
    end
end