# Acme Widget Co Sales System

This is implementation of Sales System(basket pricing system) for Acme Widget Co that calculates totals including offers and delivery charges.

## Features

- product catalog
- setup delivery charge rules
- a offer system ("buy one red widget, get second half price")
- basket management with add and total methods

## Implementation Details

### Classes

1. **Product**: a product with code, name, and price
2. **DeliveryRule**: has delivery cost rules based on order threshold
3. **Offer**: class for special offers (with HalfPriceOffer subclass implementation)
4. **Basket**: main class that manages items, calculates subtotals, handle offers, and calculate delivery charges

### Design Decisions

- Solution without framework(means no Rails)
- Code -> clear, testable and reuseable
- added Offer as a base class to make easy to add new offers
- Used Ruby's built-in test framework (RSpec) for testing

## How to Run
1. Install Ruby like with rbenv and set locally:
   ```bash
   rbenv install 3.1.2
   rbenv local 3.1.2

2. Install dependencies (only RSpec needed for testing):
   ```bash
   gem install rspec

3. #### Run all tests
    ```bash
    rspec --require spec_helper spec

4. #### Run specific class tests
    ```bash
    rspec --require spec_helper spec/basket_spec.rb
