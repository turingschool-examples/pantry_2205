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

    def enough_ingredients?(recipe)
        recipe.ingredients_required.all? do |ingredient| 
            require 'pry'; binding.pry 
            stock_check(ingredient).nil? ? false : stock_check(ingredient) >= recipe.ingredients_required[ingredient]
        end
    end
end