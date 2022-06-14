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
end