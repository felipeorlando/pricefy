RSpec.describe Order do
  subject { Order.new }
  let(:serializer) { Serializer.new }

  describe ".transform" do
    it "should serialize properly with serializer" do
      subject.transform("2 book at 12.49", serializer)

      expect(subject.qtd).to eq(2)
      expect(subject.title).to eq("book")
      expect(subject.price).to eq(12.49)
      expect(subject.is_imported).to eq(false)
    end
  end
end
