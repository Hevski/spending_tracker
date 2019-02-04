require_relative('../models/merchant')
require ('pry')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get '/merchants/new' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

post '/merchants' do
  @merchants = Merchant.new(params)
  @merchants.save()
  redirect '/merchants'
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect '/merchants'
end

post '/merchants/:id/delete' do
  @merchant = Merchant.find(params[:id]).delete
  redirect '/merchants'
end
