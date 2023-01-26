require 'shopping_basket'
require 'products'

describe 'ShoppingBasket' do
  let(:shopping_basket) { ShoppingBasket.new }

  it "Input 1:" do
    products = []

    products << Products.new(name: 'Book', quantity: 2, price: 12.49, basic_taxes: false)
    products << Products.new(name: 'music CD', quantity: 1, price: 14.99, basic_taxes: true)
    products << Products.new(name: 'chocolate bar', quantity: 1, price: 0.85, basic_taxes: false)
    input1 = ShoppingBasket.new(products)

    expect(input1.sale_taxes).to eq(1.50)
    expect(input1.total).to eq(42.32)
  end

  it "Input 2:" do
    products = []

    products << Products.new(name: 'imported box of chocolates', quantity: 1, price: 10.00, basic_taxes: false, imported: true)
    products << Products.new(name: 'imported bottle of perfume', quantity: 1, price: 47.50, basic_taxes: true, imported: true)

    input2 = ShoppingBasket.new(products)

    expect(input2.total).to eq(65.15)
  end

  it "Input 3:" do
    products = []

    products << Products.new(name: 'imported bottle of perfume', quantity: 1, price: 27.99, basic_taxes: true, imported: true)
    products << Products.new(name: 'bottle of perfume', quantity: 1, price: 18.99, basic_taxes: true)
    products << Products.new(name: 'packet of headache pills', quantity: 1, price: 9.75, basic_taxes: false, imported: false)
    products << Products.new(name: 'imported boxes of chocolates at 11.25	', quantity: 3, price: 11.25, basic_taxes: false, imported: true)

    input3 = ShoppingBasket.new(products)

    expect(input3.sale_taxes).to eq(7.90)
    expect(input3.total).to eq(98.38)
  end
end