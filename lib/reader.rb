class Reader
  def get(filepath)
    File.readlines(filepath, chomp: true)
  end
end