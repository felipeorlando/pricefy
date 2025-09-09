class Order
  attr_reader :qtd, :title, :price, :tax, :price_with_tax, :is_imported, :free_tax

  def transform(plain_order, serializer)
    @serializer = serializer
    @plain_order = plain_order
    serialize
  end

  private

  def serialize
    @qtd, @title, @price, @is_imported = @serializer.get_result(@plain_order)
  end
end