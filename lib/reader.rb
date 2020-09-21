class Reader
  def get(filepath)
    File.read(filepath).split
  end
end