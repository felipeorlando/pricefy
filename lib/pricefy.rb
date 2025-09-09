class Pricefy
  def initialize(filepath:, destination_path:, reader:)
    @filepath = filepath
    @destination_path = destination_path
    @reader = reader
  end

  def run
    items = @reader.get(@filepath)
    p items
  end
end