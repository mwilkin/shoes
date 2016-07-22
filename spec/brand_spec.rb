require('spec_helper')

describe(Brand) do
  it('belongs to a store') do
    test_store = Store.create({:name => "Sellwood Soles"})
    test_brand = Brand.create({:name => "Saucony"})
    test_store.brands.push(test_brand)
    expect(test_store.brands()).to(eq([test_brand]))
  end
end
