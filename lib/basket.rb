class Basket
  attr_reader :items

  def initialize(products:, delivery_rules:, offers:)
    @products = products
    @delivery_rules = delivery_rules.sort_by(&:threshold).reverse
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = find_product(product_code)
    @items.append(product) if product
  end

  def total
    subtotal = calculate_subtotal.round(2)
    discount = calculate_discount.round(2)
    subtotal_with_discount = (subtotal - discount).round(2)
    delivery_cost = get_delivery_cost(subtotal_with_discount).round(2)
    
    (subtotal_with_discount + delivery_cost).round(2)
  end

  def find_product(code)
    @products.find { |p| p.code == code.to_s }
  end

  def calculate_subtotal
    @items.sum(&:price)
  end

  def get_delivery_cost(subtotal)
    rule = @delivery_rules.find { |r| r.qualifies_for?(subtotal) }

    rule&.cost || 0.0
  end

  def calculate_discount
    @offers.sum do |offer|
      offer.apply(@items)
    end
  end
end
