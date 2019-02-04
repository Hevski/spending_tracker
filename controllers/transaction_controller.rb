require_relative('../models/transaction')
require_relative('../models/budget')
require ('pry')

get '/transactions' do
  @transactions = Transaction.all()
  @budget = Budget.all()
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:"transactions/index")
end

post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save()
  redirect '/transactions'
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

get '/transactions/search/merchant' do
  @merchant = Merchant.find(params['id'])
  @transactions = @merchant.transactions_for_merchant()
  erb (:"transactions/search")
end

get '/transactions/search/tag' do
  @tag = Tag.find(params['id'])
  @transactions = @tag.transactions_for_tag()
  erb (:"transactions/search")
end
