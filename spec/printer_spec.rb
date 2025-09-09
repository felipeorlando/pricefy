RSpec.describe Printer do
  let(:destination_path) { "#{File.dirname(__FILE__)}/mocks/printer/file.txt" }
  let(:classifier) { Classifier.new }
  let(:orders) { Orders.new }
  let(:printer) { Printer.new }
  let(:serializer) { Serializer.new }
  let(:taxator) { Taxator.new }

  let(:order_1) do
    item = "1 imported box of chocolates at 10.00"
    Order.new.transform(plain_order: item, serializer: serializer, classifier: classifier, taxator: taxator)
  end

  let(:order_2) do
    item = "1 imported bottle of perfume at 47.50"
    Order.new.transform(plain_order: item, serializer: serializer, classifier: classifier, taxator: taxator)
  end

  before(:each) do
    File.delete(destination_path) if File.exists? destination_path
  end

  describe ".get" do
    it "read mock text file properly" do
      orders << order_1
      orders << order_2

      printer.put(destination_path, orders)

      output = File.readlines(destination_path, chomp: true)

      expect(output).to eq([
        "1 imported box of chocolates: 10.5",
        "1 imported bottle of perfume: 54.65",
        "Sales Taxes: 7.65",
        "Total: 65.15",
      ])
    end
  end
end
