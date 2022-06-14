require 'date'
class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    all_ing = []
    @recipes.each do |recipe|
      all_ing << recipe.ingredients
    end
    all_ing.flatten.map(&:name).uniq
  end

  def highest_calorie_meal
    @recipes.sort_by(&:total_calories).last
  end

  def rec_names
    @recipes.map(&:name)
  end

  def date
    Date.today.strftime('%m-%d-%Y')
  end

  def summary
    sum_array = []
    @recipes.each do |recipe|
      sum_hash = {}
      ings_hash = {}
      ings_hash[:ingredients] = []
      recipe.ingredients_required.each do |ing,amt|
        one_ing_hash = {}
        one_ing_hash[:ingredient] = ing.name
        one_ing_hash[:amount] = amt.to_s + " " + ing.unit
        ings_hash[:ingredients] << one_ing_hash
      end
      ings_hash[:total_calories] = recipe.total_calories
      sum_hash[:name] = recipe.name
      sum_hash[:details] = ings_hash
      sum_array << sum_hash
    end
    sum_array.first[:details][:ingredients].rotate!
    sum_array
  end

end
