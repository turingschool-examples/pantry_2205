class Pantry
    attr_reader :stock
    def initialize
        @stock = {}
    end

    def restock(ingredient, qty)
        @stock[ingredient] = qty
    end

    def stock_check(ingredient)
        @stock[ingredient]
    end
end