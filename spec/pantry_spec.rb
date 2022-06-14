require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  it 'exists' do
    pantry = Pantry.new
    expect(pantry).to be_a (Pantry)
  end
end
