class Recipe
    
    attr_reader :name, :ingredients_required

    def initialize(name)
        @name = name
        @ingredients_required = Hash.new(0)
    end

    def add_ingredient(ingredient, qty)
        @ingredients_required[ingredient] += qty
    end

    def ingredients
        @ingredients_required.keys
    end

    def total_calories
        @ingredients_required.sum { |ingredient, qty| ingredient.calories * qty}
    end

    def ingredients_by_calories
        return_array = []
        return_hash = {}
        sorted_list = @ingredients_required.sort_by {|ingredient, qty| ingredient.calories * qty}
        sorted_list.reverse.each do |ingredient, qty| 
            return_array << ingredient_hash(ingredient, qty)
        end
        return_hash[:ingredients] = return_array
        return_hash[:total_calories] = total_calories
        return_hash
    end

    def ingredient_hash(ingredient, qty)
        i_hash = {}
        i_hash[:ingredient] = ingredient.name
        i_hash[:amount] = qty.to_s + " " + ingredient.unit
        i_hash
    end
end