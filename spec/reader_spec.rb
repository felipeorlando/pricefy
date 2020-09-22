RSpec.describe Reader do
  let(:reader) { Reader.new }
  let(:filepath) { "#{File.dirname(__FILE__)}/mocks/reader/file.txt" }

  describe ".get" do
    it "read mock text file properly" do
      expect(reader.get(filepath)).to eq(["lorem ipsum", "dolor sit"])
    end
  end
end
