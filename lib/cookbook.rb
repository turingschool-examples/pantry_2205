class CookBook

  attr_reader :recipes
  def initialize
    @recipes = [] 
  end

  def add_recipe(recipe)
    @recipes << recipe
    @recipes
  end

  def ingredients
   uniq_names = @recipes.flat_map do |recipe|
      recipe.ingredients_required.map { |ingred, _| ingred.name }
    end
    uniq_names.uniq
  end

  def highest_calorie_meal
   @recipes.max_by {|recipe| recipe.total_calories}
  end

  def details_hash
    #need to figure out why #s aren't adding up -> getting "4 C" instead of "2 C", "101 g" vs "100 g"
    details_hash = {}
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingred, qty|
        details_hash[:ingredient] = ingred.name
        details_hash[:amount] = qty.to_s + " " + ingred.unit
      end
    end
    details_hash
  end

  def summary
    summary_arr = []
    recipe_name_hash = {}
    @recipes.each do |recipe|
      if recipe_name_hash[recipe.name].nil?
        recipe_name_hash[recipe.name] = details_hash
      end
    end
  end
end

# finished summary method example 
# def summary
#   sum_array = []
#   @recipes.each do |recipe|
#     sum_hash = {}
#     ings_hash = {}
#     ings_hash[:ingredients] = []
#     recipe.ingredients_required.each do |ing,amt|
#       one_ing_hash = {}
#       one_ing_hash[:ingredient] = ing.name
#       one_ing_hash[:amount] = amt.to_s + " " + ing.unit
#       ings_hash[:ingredients] << one_ing_hash
#     end
#     ings_hash[:total_calories] = recipe.total_calories
#     sum_hash[:name] = recipe.name
#     sum_hash[:details] = ings_hash
#     sum_array << sum_hash
#   end
#   sum_array.first[:details][:ingredients].rotate!
#   sum_array
# end