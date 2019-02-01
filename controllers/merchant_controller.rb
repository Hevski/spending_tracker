require_relative('../models/merchant')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/new")
end
