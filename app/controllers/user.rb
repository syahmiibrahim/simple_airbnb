enable :sessions

get '/dashboard/:user_name' do 
  @user = User.find(session[:id])
  @prop = @user.properties
  @prop_list = Property.all 
  @tagged = Tag.all
  redirect to '/' unless session[:id] != nil

  erb :dashboard
end
