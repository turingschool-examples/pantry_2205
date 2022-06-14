class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(item, quantity)
    if @ingredients_required[item] == nil
      @ingredients_required.merge!(item => quantity)
    else
      @ingredients_required[item] = @ingredients_required[item] + quantity
    end
  end

  def ingredients
    # shopping_list = []
     @ingredients_required.map {|item,quantity| item.name}
    # shopping_list
  end
end
