require_relative "classifier"
require_relative "order"
require_relative "orders"
require_relative "printer"
require_relative "reader"
require_relative "round"
require_relative "serializer"
require_relative "taxator"

class Pricefy
  def initialize(filepath:, destination_path:)
    @filepath = filepath
    @destination_path = destination_path

    @classifier = Classifier.new
    @orders = Orders.new
    @printer = Printer.new
    @reader = Reader.new
    @serializer = Serializer.new
    @taxator = Taxator.new
  end

  def run
    items = @reader.get(@filepath)

    items.each do |item|
      order = Order.new.transform(plain_order: item, serializer: @serializer, classifier: @classifier, taxator: @taxator)
      @orders << order
    end

    @orders.list.each { |i| puts i.title }

    @printer.put(@destination_path, @orders)
  end
end