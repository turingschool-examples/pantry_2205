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

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    calories_array = ingredients.map do |ingredient_instance|
      ingredient_instance.calories * @ingredients_required[ingredient_instance]
    end
    calories_array.sum
  end
end
