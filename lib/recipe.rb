class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    cals_per_ingredient = @ingredients_required.map do |ingredient, amount|
      ingredient.calories * amount
    end
    total_cals = cals_per_ingredient.sum
  end

  def simplified_ingredients_by_calorie
    simplified_ingr_by_cal = ingredients_sorted_by_calorie.map do |ingr, cal_and_amt|
      {ingredient: ingr.name,
      amount: cal_and_amt[:amount].to_s + " " + ingr.unit}
    end
  end

  def ingredients_sorted_by_calorie
    ingredients_by_calorie_and_amount.sort_by { |_ingredient, cal_and_amt| -cal_and_amt[:calories]}.to_h
  end

  def ingredients_by_calorie_and_amount
    ingredients_and_cal = {}
    @ingredients_required.each do |ingredient, amount|
      ingredients_and_cal[ingredient] = {
        calories: ingredient.calories * amount,
        amount: amount
      }
    end
    ingredients_and_cal
  end
end
