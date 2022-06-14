class Recipe
    attr_reader :name, :required_ingredients

    def initialize(name)
        @name = name
        @required_ingredients = {}
    end
end