enable :session

get '/property/add' do  
  erb :addproperty
end

post '/property/add' do
  input = params[:post]

  @user = User.find(session[:id])
  new_prop = @user.properties.create(
    title: input[:title],
    address: input[:address],
    description: input[:description],
    price: input[:price]
    )
  
  tags_obj = Tag.create_tags(input[:tag])
  
  if new_prop.save
    tags_obj.each do |t|
      new_prop.tags << t
    end
    redirect to "/dashboard/#{new_prop.user.name}"
  else
    session[:err_msg] = "Error in creating a new property. try again"
    redirect to '/property/add'
  end
end