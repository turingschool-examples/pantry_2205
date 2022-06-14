class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient|
        if ingredients.include?(ingredient[0].name) != true
          ingredients << ingredient[0].name
        end
      end
    end
    ingredients
  end

end
