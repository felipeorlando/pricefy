class Orders
  attr_reader :list

  def initialize
    @list = []
  end

  def <<(product)
    @list << product
  end

  def total_price_with_taxes
    @list.map(&:price_with_tax).inject(0, &:+)
  end

  def total_taxes
    @list.map(&:tax).inject(0, &:+)
  end
end