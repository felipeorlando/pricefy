RSpec.describe Orders do
  let(:classifier) { Classifier.new }
  let(:serializer) { Serializer.new }
  let(:taxator) { Taxator.new }

  describe ".<<" do
    let(:orders) { Orders.new }

    it "add passed argument to @list" do
      orders << "lorem"

      expect(orders.list).to include("lorem")
    end
  end

  describe ".total_price_with_taxes" do
    let(:orders) { Orders.new }

    let(:order_1) do
      item = "1 imported box of chocolates at 10.00"
      Order.new.transform(plain_order: item, serializer: serializer, classifier: classifier, taxator: taxator)
    end
  
    let(:order_2) do
      item = "1 imported bottle of perfume at 47.50"
      Order.new.transform(plain_order: item, serializer: serializer, classifier: classifier, taxator: taxator)
    end

    it do
      orders << order_1
      orders << order_2

      expect(orders.total_price_with_taxes).to eq(65.15)
    end
  end

  describe ".total_taxes" do
    let(:orders) { Orders.new }

    let(:order_1) do
      item = "1 imported box of chocolates at 10.00"
      Order.new.transform(plain_order: item, serializer: serializer, classifier: classifier, taxator: taxator)
    end
  
    let(:order_2) do
      item = "1 imported bottle of perfume at 47.50"
      Order.new.transform(plain_order: item, serializer: serializer, classifier: classifier, taxator: taxator)
    end

    it do
      orders << order_1
      orders << order_2

      expect(orders.total_taxes).to eq(7.65)
    end
  end
end
