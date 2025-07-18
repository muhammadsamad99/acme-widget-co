class DeliveryRule
  attr_reader :threshold, :cost

  def initialize(threshold:, cost:)
    @threshold = threshold.to_f
    @cost = cost.to_f
  end

  # free delivery if $90+, $2.95 if $50-$89.99 and $4.95 if <$50
  def self.delivery_rules
    [
      new(threshold: 0.0, cost: 4.95),
      new(threshold: 50.0, cost: 2.95),
      new(threshold: 90.0, cost: 0.0)
    ].sort_by(&:threshold).reverse
  end

  def qualifies_for?(subtotal)
    subtotal >= threshold # check which delivery rule applies
  end
end
