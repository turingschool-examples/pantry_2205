require './lib/recipe'
require './lib/cook_book'

RSpec.describe CookBook do
  it 'exists' do
    cookbook = CookBook.new
    expect(cookbook).to be_a(CookBook)
  end
end
