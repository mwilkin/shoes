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
  @brands = Brand.all()
  erb(:stores)
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  erb(:store)
end

post('/stores') do
  name = params.fetch('store_name')
  new_store = Store.create({:name => name})
  redirect('/stores')
end


post('/stores/:id/update') do
  @store = Store.find(params.fetch('id').to_i)
  @brands = Brand.all()
  erb(:store_update)
end

patch('/stores/:id') do
  name = params.fetch('new_store_name')
  @store = Store.find(params.fetch('id').to_i)
  @store.update({:name => name})
  redirect('/stores/'.concat(@store.id().to_s))
end

delete('/stores/:id') do
  store = Store.find(params.fetch('id').to_i)
  store.delete()
  redirect('/stores')
end
