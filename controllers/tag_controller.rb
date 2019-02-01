require_relative('../models/tag')

get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tags/new' do
  @houses = Tag.all()
  erb(:"tags/new")
end

post '/tags' do
  @tags = Tag.new(params)
  @tags.save()
  erb(:"tags/create")
end

get '/tags/:id/edit' do
  @tags = Tag.find(params[:id])
  erb(:"tags/edit")
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect '/tags'
end

post '/tags/:id/delete' do
  @tags = Tags.find(params[:id]).delete
  redirect '/delete'
end
