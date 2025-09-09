RSpec.describe Taxator do
  let(:taxator) { Taxator.new }

  describe ".calculate?" do
    context "when order is taxed" do
      subject { taxator.calculate(100, false, false) }

      it { expect(subject).to be(10) }
    end

    context "when order is taxed and imported" do
      subject { taxator.calculate(100, true, false) }

      it { expect(subject).to be(15) }
    end

    context "when order is tax exempt" do
      subject { taxator.calculate(100, false, true) }

      it { expect(subject).to be(0) }
    end

    context "when order is tax exempt and imported" do
      subject { taxator.calculate(100, true, true) }

      it { expect(subject).to be(5) }
    end
  end
end
