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
            if @stock[ingredient] == nil
                false
            else
                @stock[ingredient] >= qty
            end
            # return false if @stock[ingredient] == nil
            # return false if stock_check(ingredient).nil?
            # return true if @stock[ingredient] >= qty
        end
        # require 'pry'; binding.pry 
        # recipe.ingredients_required.all? do |ingredient|
        # ingredient[1] <= @stock[ingredient[0]] 
        #     require 'pry'; binding.pry 
            # return false if nil_check(ingredient) || ingredient_amt_required(recipe, ingredient) == nil
            # nil_check(ingredient) == true  && (ingredient_amt_required(recipe, ingredient) <= stock_check(ingredient))
            # require 'pry'; binding.pry 
            # (recipe.ingredients_required[ingredient] <= stock_check(ingredient)) || false
            # require 'pry'; binding.pry 
            # if stock_check(ingredient) != nil
            # stock_check(ingredient) >= recipe.ingredients_required[ingredient]
            # else
            #     false
            # end
             
            # nil == @stock[ingredient] ? false : stock_check(ingredient) >= recipe.ingredients_required[ingredient]
        # end
    end
end