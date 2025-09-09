class Serializer
  def get_result(plain_order)
    @plain_order = plain_order

    serialize

    [@qtd, @title, @price, @is_imported]
  end

  private

  def serialize
    set_simple_infos
    set_is_imported
  end

  def set_simple_infos
    string_qtd, rest = @plain_order.split(" ", 2)
    @qtd = string_qtd.to_i
    @title, string_price = rest.split(" at ", 2)
    @price = string_price.to_f
  end

  def set_is_imported
    @is_imported = @title.include?("imported")
  end
end