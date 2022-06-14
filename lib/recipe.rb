class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(name, amount)
    @ingredients_required[name] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total_calories = 0
    @ingredients_required.each do |keys, values|
      total_calories += (keys.calories * values)
    end
    total_calories
  end

end
