require('spec_helper')

describe(Brand) do
  it('belongs to a store') do
    test_store = Store.create({:name => "Sellwood Soles"})
    test_brand = Brand.create({:name => "Saucony"})
    test_store.brands.push(test_brand)
    expect(test_store.brands()).to(eq([test_brand]))
  end
  it('validates the presence of a name') do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end
  it('changes the case if the first letter of the store name') do
    brand = Brand.create({:name => 'cOOKIE'})
    expect(brand.name()).to(eq('Cookie'))
  end
end
