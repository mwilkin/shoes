require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

post('/brands') do
  name = params.fetch('brand_name')
  new_brand = Brand.create({:name => name})
  redirect('/brands')
end
