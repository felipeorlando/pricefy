class Taxator
  BASIC_SALES_TAX_PERCENT = 10
  IMPORTED_TAX_PERCENT = 5

  def calculate(price, is_imported, tax_exempt)
    @price = price
    @is_imported = is_imported
    @tax_exempt = tax_exempt

    simple_tax + import_tax
  end

  private

  def simple_tax
    @tax_exempt ? 0 : percent(@price, BASIC_SALES_TAX_PERCENT)
  end

  def import_tax
    @is_imported ? percent(@price, IMPORTED_TAX_PERCENT) : 0
  end

  def percent(value, percentage)
    (value * percentage / 100)
  end
end