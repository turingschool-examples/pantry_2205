class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    return 0 if @stock == {}
    if @stock.include?(ingredient)
      @stock[ingredient]
    else
      0
    end
  end

  def restock(ingredient, quantity)
    if @stock.include?(ingredient) == false
      @stock[ingredient] = quantity
    else
      @stock[ingredient] += quantity
    end
  end

  def enough_ingredients_for?(recipe) #cannot get @stock[ingredient_instance.flatten to return a single array to use to get the value/integer]
    answer = []
    recipe.ingredients_required.each do |ingredient_instance|
      if @stock[ingredient_instance.flatten] >= ingredient_instance[1]
        answer << true
      else
        answer << false
      end
    end
    if answer.include?(false)
      false
    else
      true
    end
  end
end
