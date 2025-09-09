require "reader"

RSpec.describe Reader do
  let!(:reader) { Reader.new }
  let!(:filepath) { "#{File.dirname(__FILE__)}/mocks/file.txt" }

  describe ".get" do
    it "read mock text file properly" do
      expect(reader.get(filepath)).to eq(["lorem", "ipsum"])
    end
  end
end
