RSpec.describe Order do
  subject { Order.new }
  let(:serializer) { Serializer.new }
  let(:classifier) { Classifier.new }

  describe ".transform" do
    it "should serialize and classfy properly" do
      subject.transform("2 book at 12.49", serializer, classifier)

      expect(subject.qtd).to eq(2)
      expect(subject.title).to eq("book")
      expect(subject.price).to eq(12.49)
      expect(subject.is_imported).to be_falsy
      expect(subject.tax_exempt).to be_truthy
    end
  end
end
