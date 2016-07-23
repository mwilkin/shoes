require('spec_helper')

describe(Store) do
  it('has many brands') do
    test_store = Store.create({:name => "Fleet Feet"})
    test_brand1 = Brand.create({:name => "Altra"})
    test_brand2 = Brand.create({:name => "Saucony"})
    test_brand3 = Brand.create({:name => "Nike"})
    test_store.brands.push(test_brand1)
    test_store.brands.push(test_brand2)
    test_store.brands.push(test_brand3)
    expect(test_store.brands()).to(eq([test_brand1, test_brand2, test_brand3]))
  end
  it('validates the presence of a name') do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end
  it('changes the case if the first letter of the store name') do
    store = Store.create({:name => 'brooks'})
    expect(store.name()).to(eq('Brooks'))
  end
end
