class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    recipe_ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
      recipe_ingredients << ingredient.name
      end
    end
    recipe_ingredients.uniq
  end

  def highest_calorie_meal
    recipe_calorie_count = Hash.new
    @recipes.each do |recipe|
      recipe_calorie_count[recipe] = recipe.total_calories
    end
    recipe_calorie_count.index(recipe_calorie_count.values.max)
  end

  def summary
    summary = []
    summary_item = {}
    # {:name=>"Mac and Cheese",
     # :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
       # {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}
     #  }
    @recipes.each do |recipe|
      summary_item[:name] = recipe.name
      details = {}
      ingredients_hash = {}
      ingredients_array = []
      total_calories = 0
      recipe.ingredients_required.each do |ing, value|
        ingredients_hash[:ingredient] = ing.name
        ingredients_hash[:amount] = "#{value.to_s + ing.unit}"
        total_calories = ing.calories * value
        ingredients_array << ingredients_hash
      end
      details[:total_calories] = total_calories
      details[:ingredients] = ingredients_array
      summary_item[:details] = details
    end
  end
end
