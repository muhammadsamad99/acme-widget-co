class Offer
  attr_reader :product_code, :description

  def initialize(product_code:, description:)
    @product_code = product_code.to_s
    @description = description.to_s
  end

  def apply(items)
    raise NotImplementedError, "subclass must implement this method"
  end

  def self.red_widget_offer
    new(
      product_code: 'R01',
      description: 'Buy one red widget, get second with half price'
    )
  end
end

# added this as a new class to add more types of offers
class HalfPriceOffer < Offer
  def apply(items)
    applicable_items = items.select { |item| item.code == product_code } # products with same code
    return 0 if applicable_items.size < 2

    discount_times = applicable_items.size / 2
    discount_amount = applicable_items.first.price / 2 * discount_times

    discount_amount
  end
end
