RSpec.describe Order do
  subject { Order.new }
  let(:classifier) { Classifier.new }
  let(:serializer) { Serializer.new }
  let(:taxator) { Taxator.new }

  describe ".transform" do
    it "serialize, classify and tax properly" do
      subject.transform(plain_order: "2 book at 12.49", serializer: serializer, classifier: classifier,
                        taxator: taxator)

      expect(subject.qtd).to eq(2)
      expect(subject.title).to eq("book")
      expect(subject.unit_price).to eq(12.49)
      expect(subject.price).to eq(24.98)
      expect(subject.is_imported).to be_falsy
      expect(subject.tax_exempt).to be_truthy
      expect(subject.tax).to be_zero
    end
  end

  describe ".price_with_tax" do
    it do
      subject.transform(plain_order: "2 bottle of perfume at 12.49", serializer: serializer, classifier: classifier,
                        taxator: taxator)

      expect(subject.price_with_tax).to eq(27.48)
    end
  end

  describe ".price" do
    it do
      subject.transform(plain_order: "2 bottle of perfume at 12.49", serializer: serializer, classifier: classifier,
                        taxator: taxator)
                        
      expect(subject.price).to eq(24.98)
    end
  end
end
