require_relative "classifier"
require_relative "order"
require_relative "orders"
require_relative "reader"
require_relative "serializer"

class Pricefy
  def initialize(filepath:, destination_path:)
    @filepath = filepath
    @destination_path = destination_path

    @classifier = Classifier.new
    @reader = Reader.new
    @order = Order.new
    @orders = Orders.new
    @serializer = Serializer.new
  end

  def run
    items = @reader.get(@filepath)
    
    items.each do |item|
      order = @order.transform(item, @serializer, @classifier)
      @orders << order
    end
  end
end