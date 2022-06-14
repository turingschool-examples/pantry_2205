class Pantry
    attr_reader :stock
    def initialize
        @stock = {}
    end

    def stock_check(ingredient)
        @stock[ingredient]
    end

    def restock(ingredient, qty)
        @stock.merge!({ingredient => qty}) { |key, oldval, newval| oldval + newval }
    end

    def nil_check(ingredient)
        @stock[ingredient].nil?
    end

    def ingredient_amt_required(recipe, ingredient)
        recipe.ingredients_required[ingredient]
    end

    def enough_ingredients?(recipe)
        recipe.ingredients_required.all? do |ingredient, qty|
            @stock[ingredient] == nil ? false : @stock[ingredient] >= qty
        end
    end
end