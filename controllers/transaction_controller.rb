require_relative('../models/transaction')
require ('pry')

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end


# get '/transaction' do
#
# end
