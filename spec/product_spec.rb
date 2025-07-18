RSpec.describe Product do
  let(:product) { Product.new(code: 'R01', name: 'Red Widget', price: 32.95) }

  describe '#initialize' do
    it 'intialize with code, name and price' do
      expect(product.code).to eq('R01')
      expect(product.name).to eq('Red Widget')
      expect(product.price).to eq(32.95)
    end
  end

  describe '#==' do
    it 'compares products with code' do
      same = Product.new(code: 'R01', name: 'Red Widget', price: 99)
      different = Product.new(code: 'G01', name: 'Green Widget', price: 32.95)
      
      expect(product).to eq(same)
      expect(product).not_to eq(different)
    end
  end
end
