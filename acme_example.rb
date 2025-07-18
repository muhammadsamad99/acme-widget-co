require_relative 'lib/product'
require_relative 'lib/delivery_rule'
require_relative 'lib/offer'
require_relative 'lib/basket'

products = [
  Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
  Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
  Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
]

# set delivery rules
delivery_rules = DeliveryRule.delivery_rules

# set offers
offers = [HalfPriceOffer.red_widget_offer]

# 1 Blue and 1 Green product in a basket
basket = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket.add('B01')
basket.add('G01')
puts "B01, G01 -> $#{basket.total}"

# 2 red products in a bascket
basket = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket.add('R01')
basket.add('R01')
puts "R01, R01 -> $#{basket.total}"

# 1 red and 1 green product
basket = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket.add('R01')
basket.add('G01')
puts "R01, G01 -> $#{basket.total}"

# 2 blue and 3 red products.
basket = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
basket.add('B01')
basket.add('B01')
basket.add('R01')
basket.add('R01')
basket.add('R01')
puts "B01, B01, R01, R01, R01 -> $#{basket.total}"
