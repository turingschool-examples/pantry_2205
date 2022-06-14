require './lib/cookbook'

RSpec.describe CookBook do
  before :each do
    @cookbook = CookBook.new
  end

  describe '#initialize' do
    it 'is a Cookbook' do
      expect(@cookbook).to be_a CookBook
    end

    it 'initializes with an empty array of recipes' do
      expect(@cookbook.recipes).to eq []
    end
  end
end
