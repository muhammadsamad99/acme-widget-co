RSpec.describe HalfPriceOffer do
  let(:red_widget) { Product.new(code: 'R01', name: 'Red Widget', price: 32.95) }
  let(:offer) { HalfPriceOffer.red_widget_offer }

  describe '#apply' do
    it 'returns 0 for no matching item' do
      items = []
      expect(offer.apply(items)).to eq(0)
    end

    it 'returns 0 for single matching item' do
      items = [red_widget]
      expect(offer.apply(items)).to eq(0)
    end

    it 'applies discount with two matching item' do
      items = [red_widget, red_widget]
      expect(offer.apply(items)).to be_within(0.001).of(16.475)
    end
  end
end
