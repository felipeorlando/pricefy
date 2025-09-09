class Order
  attr_reader :qtd, :title, :unit_price, :tax, :price_with_tax, :is_imported, :tax_exempt

  def transform(plain_order:, serializer:, classifier:, taxator:)
    @plain_order = plain_order
    @serializer = serializer
    @classifier = classifier
    @taxator = taxator

    serialize
    classify
    taxify
    self
  end

  def price_with_tax
    Round.round(price + tax)
  end
  
  def price
    Round.round(@qtd * @unit_price)
  end

  private

  def serialize
    @qtd, @title, @unit_price, @is_imported = @serializer.get_result(@plain_order)
  end

  def classify
    @tax_exempt = @classifier.is_tax_exempt?(@title)
  end

  def taxify
    @tax = @taxator.calculate(price, @is_imported, @tax_exempt)
  end
end