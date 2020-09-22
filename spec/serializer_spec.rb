RSpec.describe Serializer do
  let(:serializer) { Serializer.new }

  describe ".get_result" do
    context "simple order" do
      subject { serializer.get_result("2 book at 12.49") }

      it "should serialize properly" do
        expect(subject).to eq([2, "book", 12.49, false])
      end
    end

    context "imported order" do
      subject { serializer.get_result("3 imported boxes of chocolates at 11.25") }
  
      it "should serialize properly" do
        expect(subject).to eq([3, "imported boxes of chocolates", 11.25, true])
      end
    end
  end
end
