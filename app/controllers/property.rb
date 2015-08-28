enable :session

get '/property/add' do  
  @user = User.find(session[:id])
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

get '/property/details/:id' do
  @user = User.find(session[:id])
  @property = Property.find(params[:id])
  erb :detailproperty
end


get '/property/edit/:id' do
  @user = User.find(session[:id])
  @property = Property.find(params[:id])
  erb :editproperty
end

post '/property/edit/:id' do
  input = params[:post]
  
  @property = Property.find(params[:id])

  @property.update(
    title: input[:title],
    address: input[:address],
    description: input[:description],
    price: input[:price]
    )

    tags_obj = Tag.create_tags(input[:tag])

    if @property.save
      @property.tags.delete_all

      tags_obj.each do |t|
        @property.tags << t
      end
      redirect to "/property/details/#{@property.id}"
    else
      session[:err_msg] = "Error in updating your property. Try again"
      redirect to "/property/edit/#{params[:id]}"
    end
end

get '/property/delete/:id' do
   @user = User.find(session[:id])
   property_delete = Property.find(params[:id])
   property_delete.destroy

  redirect to "/dashboard/#{@user.name}"
end