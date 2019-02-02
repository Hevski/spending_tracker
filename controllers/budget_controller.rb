require_relative('../models/budget')
require_relative('../models/transaction')
#require_relative(',/transaction_controller')
require ('pry')

get '/budgets' do
  @budget = Budget.all()
  erb(:"transactions/index")
end

get '/budgets/new' do
  @budget = Budget.all()
  erb(:home)
end

post '/budgets' do
  @budget = Budget.new(params)
  @budget.save()
  erb(:"budgets/create")
end
