require_relative('../models/transaction')
require ('pry')

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save()
  erb(:"transactions/create")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update()
  redirect '/transactions'
end

get '/transactions/total' do
  @transactions = Transaction.all()
  erb(:"transaction/index")
end
