RSpec.describe Basket do
  let(:products) {
    [
      Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
      Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
      Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
    ]
  }
  let(:delivery_rules) { DeliveryRule.delivery_rules }
  let(:offers) { [HalfPriceOffer.red_widget_offer] }
  let(:basket) { Basket.new(products: products, delivery_rules: delivery_rules, offers: offers) }

  describe '#add' do
    it 'add product to basket' do
      expect { basket.add('R01') }.to change { basket.items.size }.by(1)
    end
  end

  describe '#total' do
    it 'calculate total of B01 and G01' do
      basket.add('B01')
      basket.add('G01')
      expect(basket.total).to eq(37.85)
    end

    it 'calculate total of R01 and R01' do
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to be_within(0.01).of(54.37)
    end

    it 'calculate total of R01 and G01' do
      basket.add('R01')
      basket.add('G01')
      expect(basket.total).to eq(60.85)
    end

    it 'calculate total of B01, B01, R01, R01 and R01' do
      basket.add('B01')
      basket.add('B01')
      basket.add('R01')
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to eq(98.27)
    end
  end
end
