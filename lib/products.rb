require "round"

class Products
  attr_accessor :name, :quantity, :price, :basic_taxes, :imported

  def initialize(name:, quantity:, price:, basic_taxes:, imported: false)
    @name = name
    @quantity = quantity
    @price = price
    @basic_taxes = basic_taxes
    @imported = imported
    @taxes = 0
  end

  def amount
    amount = (quantity * price).to_f
    if basic_taxes && imported
      amount = cal_taxes(amount, 15)
    elsif basic_taxes
      amount = cal_taxes(amount, 10)
    elsif imported
      amount = cal_taxes(amount, 5)
    end
    amount
  end

  def get_taxes
    amount if @taxes.zero?
    @taxes
  end

  private

  def cal_taxes( amount, percentage)
    @taxes = (percentage * amount) / 100
    Round.nearest_05(@taxes + amount)
  end
end