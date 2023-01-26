# require_relative '../lib/product'
require 'products'

describe 'Products' do
  let(:products) { Product.new }

  it 'The products as books do not have taxes ' do
    books = Products.new(name: 'Book', quantity: 2, price: 12.49, basic_taxes: false)

    expect(books.amount).to eq(24.98)
  end

  it 'The music CD have the 10% of taxes' do
    music_cd = Products.new(name: 'music CD', quantity: 1, price: 14.99, basic_taxes: true)

    expect(music_cd.amount).to eq(16.49)
  end

  it "Chocolate bar have 0% of taxes" do
    choco_bar = Products.new(name: 'chocolate bar', quantity: 1, price: 0.85, basic_taxes: false)

    expect(choco_bar.amount).to eq(0.85)
  end

  it "Imported bottle of prefume have % of taxex" do
    perfume = Products.new(name: 'imported bottle of perfume', quantity: 1, price: 47.5, basic_taxes: true, imported: true)

    expect(perfume.amount).to eq(54.65)
  end

  it "Imported Chocolate have 5% of taxes" do
    box_choco = Products.new(name: 'imported boxes of chocolates', quantity: 3, price: 11.25, basic_taxes: false, imported: true)

    expect(box_choco.amount).to eq(35.55)
  end
end