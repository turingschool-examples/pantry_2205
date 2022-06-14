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
      recipe.ingredients_required.map { |ingred| ingred.first.name }
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
      recipe.ingredients_required.each do |ingred|
        details_hash[:ingredient] = ingred.first.name
        details_hash[:amount] = ingred.last.to_s + " " + ingred.first.unit
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
        require 'pry'; binding.pry
      end
    end
  end
end