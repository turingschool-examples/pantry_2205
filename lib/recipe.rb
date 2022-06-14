class Recipe
    attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(item, amount)
    @ingredients_required[item] += amount
    @ingredients.include?(item) ? nil : @ingredients << item
  end

  def total_calories
    total = @ingredients_required.map { |ingredient, amount| ingredient.calories * amount }
    total.sum
  end
end
