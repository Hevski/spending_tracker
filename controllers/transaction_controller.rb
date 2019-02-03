require_relative('../models/transaction')
require_relative('../models/budget')
require ('pry')

get '/transactions' do
  @transactions = Transaction.all()
  @budget = Budget.all()
  erb(:"transactions/index")
end

post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save()
  redirect '/transactions'
  #erb(:"transactions/create")
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

post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id]).delete
  redirect '/transactions'
end
