RSpec.describe DeliveryRule do
  describe 'call delivery_rules' do
    it 'returns the standard delivery rules' do
      rules = DeliveryRule.delivery_rules
      expect(rules.size).to eq(3)
      expect(rules.map(&:class).uniq).to eq([DeliveryRule])
    end
  end

  describe '#qualifies_for?' do
    let(:rule) { DeliveryRule.new(threshold: 50, cost: 2.95) }

    it 'returns true when subtotal meets threshold' do
      expect(rule.qualifies_for?(55)).to be true
      expect(rule.qualifies_for?(59)).to be true
    end

    it 'returns false when subtotal is below threshold' do
      expect(rule.qualifies_for?(41)).to be false
    end
  end
end
