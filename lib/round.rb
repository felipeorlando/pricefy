class Round
  NEAREST_CENT = 1 / 0.05

  def self.round(amount)
    ((amount * NEAREST_CENT).ceil / NEAREST_CENT)
  end
end