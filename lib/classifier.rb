class Classifier
  FOODS = ["chocolate"]
  MEDICINES = ["pills"]

  def is_tax_exempt?(product_title)
    @product_title = product_title

    is_food? || is_medicine? || is_book?
  end

  def is_food?
    FOODS.any? { |food| @product_title.include?(food) }
  end

  def is_medicine?
    MEDICINES.any? { |medicine| @product_title.include?(medicine) }
  end
  
  def is_book?
    @product_title.include?("book")
  end
end