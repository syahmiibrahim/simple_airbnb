enable :sessions

get '/signup' do
  erb :signup
end

post '/signup' do
  input = params[:post]
  u = User.find_by(email: input[:email])

  if u.nil?
    @user = User.create(
            name: input[:name],
            email: input[:email],
            password: input[:password],
            )
    @users = User.find_by(email: @user.email)
    session[:id] = @users.id
    session[:name] = @users.name
    redirect to '/dashboard'
  else
    @errors =["Email is already used. Please user another email"]
    redirect to '/signup'
  end

end

post '/login' do
  input= params[:post]
  @user = User.authenticate(input[:email],input[:password])

  if @user
    session[:id] = @user.id
    session[:name] = @user.name
    redirect to '/dashboard'
  else
    @errors =["Invalid email/password. Please try again"]
    redirect to '/'
  end
end

get '/dashboard' do
  if session[:id] != nil
    @user = User.find(session[:id])
    session[:name] = @user.name
    redirect to "/dashboard/#{@user.name}"
  else
    @errors = ["Please login to view dashboard"]
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end



