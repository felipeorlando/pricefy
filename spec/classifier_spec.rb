RSpec.describe Classifier do
  let(:classifier) { Classifier.new }

  describe ".is_tax_exempt?" do
    context "when order is chocolate" do
      subject { classifier.is_tax_exempt?("imported box of chocolates") }

      it { expect(subject).to be_truthy }
    end

    context "when order is medicine" do
      subject { classifier.is_tax_exempt?("packet of headache pills") }

      it { expect(subject).to be_truthy }
    end

    context "when order is book" do
      subject { classifier.is_tax_exempt?("book") }

      it { expect(subject).to be_truthy }
    end

    context "when order is bottle of perfume" do
      subject { classifier.is_tax_exempt?("bottle of perfume") }

      it { expect(subject).to be_falsy }
    end
  end
end
