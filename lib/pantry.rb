require 'pry'

class Pantry
    attr_reader :stock
    def initialize
        @stock = Hash.new(0)
    end

    def stock_check(ingredient)
       if @stock.has_key?(ingredient) == false
        return 0
       else
        return @stock[ingredient]
       end
    end

    def restock(ingredient, quantity)
        @stock[ingredient] += quantity
    end

    def enough_ingredients_for?(recipe)
        recipe.ingredients_required.all? do |ingredient, amount|
            @stock[ingredient] >= amount
        end
    end
end