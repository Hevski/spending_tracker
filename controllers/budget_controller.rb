require_relative('../models/budget')
require_relative('../models/tag')
require ('pry')

get '/budgets' do
  @budget = Budget.all()
  @tags = Tag.all()
  erb(:"budgets/index")
end

get '/budgets/new' do
  @budget = Budget.all()
  @tags = Tag.all()
  erb(:"budgets/index")
end

post '/budgets' do
  @budget = Budget.new(params)
  @budget.save()
  erb(:"budgets/create")
end

get '/budgets/:id/edit' do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

post '/budgets/:id' do
  budget = Budget.new(params)
  budget.update()
  redirect '/budgets'
end

post '/budgets/:id/delete' do
  @budget = Budget.find(params[:id]).delete
  redirect '/budgets'
end
