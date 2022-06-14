require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do
  before :each do
    @pantry= Pantry.new
  end

  it 'exists' do
    expect(@pantry).to be_a(Pantry)
  end
  it 'has a stock set to an empty hash' do
    expect(@pantry.stock).to eq({})
  end

  
