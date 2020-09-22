class Order
  attr_reader :qtd, :title, :price, :tax, :price_with_tax, :is_imported, :tax_exempt

  def transform(plain_order, serializer, classifier)
    @plain_order = plain_order
    @serializer = serializer
    @classifier = classifier
    serialize
    classify
  end

  private

  def serialize
    @qtd, @title, @price, @is_imported = @serializer.get_result(@plain_order)
  end

  def classify
    @tax_exempt = @classifier.is_tax_exempt?(@title)
  end
end