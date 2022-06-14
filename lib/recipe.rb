class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    if @ingredients_required.include?(ingredient) == false
      @ingredients_required[ingredient] = quantity
    else
      @ingredients_required[ingredient] += quantity
    end
  end
end
