class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, number)
    if @ingredients_required[ingredient] == nil
      @ingredients_required[ingredient] = number
    else
      @ingredients_required[ingredient] += number
    end
  end
end
