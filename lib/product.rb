class Product
  attr_reader :code, :name, :price

  def initialize(code:, name:, price:)
    @code = code.to_s
    @name = name.to_s
    @price = price.to_f
  end

  def ==(other)
    other.is_a?(self.class) && code == other.code
  end
  alias eql? ==

  def ===(other)
    self == other
  end

  def hash
    code.hash
  end
end
