require './lib/ingredient'
require './lib/pantry'

class Recipe

  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient,amount)
    if @ingredients_required[ingredient] == nil
      @ingredients_required[ingredient] = amount
    else
      @ingredients_required[ingredient] = (@ingredients_required[ingredient] += amount)
    end
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    return_sum = 0
    @ingredients_required.sum {|ingredient,amount| ingredient.calories * amount }
  end

  def ingredient_summary
    return_array = []

    @ingredients_sorted_by_calories = @ingredients_required.sort_by {|ingredient,amount| ingredient.calories * amount}.reverse

    @ingredients_sorted_by_calories.each do |ingredient,amount|
      return_array << {
        :ingredient => ingredient.name,
        :amount => "#{amount} #{ingredient.unit}"
      }
    end
    # binding.pry
    return_array
  end

end
