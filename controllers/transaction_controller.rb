require_relative('../models/transaction')
require ('pry')

get '/transactions' do
  #binding.pry
  @transactions = Transaction.all()
  erb(:"transactions/index")
end


# get '/transaction' do
#
# end
