class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new
  end

  def add_ingredient(ingredient, num)
     if @ingredients_required[ingredient] == nil
       @ingredients_required[ingredient] = 0
     end
     @ingredients_required[ingredient] += num
   end

   def ingredients
     @ingredients_required.keys
   end

   def total_calories
     total = 0
     @ingredients_required.each do |ingredient, num|
       total += (ingredient.calories * num)
     end
     total
   end

end
