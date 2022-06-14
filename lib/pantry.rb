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
        false if @stock[ingredient].nil?
    end

    def enough_ingredients?(recipe)
        recipe.ingredients_required.all? do |ingredient|
            return false if nil_check(ingredient) == false
            @stock[ingredient] >= recipe.ingredients_required[ingredient]
            # require 'pry'; binding.pry 
            # if stock_check(ingredient) != nil
            #     stock_check(ingredient) >= recipe.ingredients_required[ingredient]
            # else
            #     false
            # end
             
            # nil == @stock[ingredient] ? false : stock_check(ingredient) >= recipe.ingredients_required[ingredient]
        end
    end
end