class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    all_the_calories = []
    @ingredients_required.each do |ingredient, quantity|
      all_the_calories << ingredient.calories += quantity
    end
    all_the_calories
  end
end
