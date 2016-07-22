require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/brands') do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:brands)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i)
  erb(:brand)
end

post('/brands') do
  name = params.fetch('brand_name')
  new_brand = Brand.create({:name => name})
  redirect('/brands')
end

post('/brands/:id/update') do
  @brand = Brand.find(params.fetch('id').to_i)
  erb(:brand_update)
end

patch('/brands/:id') do
  name = params.fetch('new_brand_name')
  @brand = Brand.find(params.fetch('id').to_i)
  @brand.update({:name => name})
  redirect('/brands/'.concat(@brand.id().to_s))
end

delete('/brands/:id') do
  brand = Brand.find(params.fetch('id').to_i)
  brand.delete()
  redirect('/brands')
end

get('/stores') do
  @stores = Store.all()
  @brand = Brand.all()
  erb(:stores)
end

post('/stores') do
  name = params.fetch('store_name')
  store = Store.create({:name => name})
  redirect('/stores')
end
