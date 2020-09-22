class Orders
  attr_reader :list

  def initialize
    @list = []
  end

  def <<(product)
    @list << product
  end
end