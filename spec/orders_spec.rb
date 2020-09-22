RSpec.describe Orders do
  let!(:orders) { Orders.new }

  describe ".<<" do
    it "add passed argument to @list" do
      orders << "lorem"

      expect(orders.list).to include("lorem")
    end
  end
end
