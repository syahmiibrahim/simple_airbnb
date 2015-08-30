require 'date'

get '/book/new/:id' do
    @user = User.find(session[:id])
    @property = Property.find(params[:id])

    erb  :bookproperty
end

post '/book/new/:id' do


  # date_from = Date.parse(params[:from_year]+"-"+params[:from_month]+"-"+params[:from_year])
  # date_until = Date.parse(params[:to_year]+"-"+params[:to_month]+"-"+params[:to_year])
  date_from = params[:startdate]
  date_until = params[:enddate]
  Booking.create(user_id: session[:id], property_id: params[:id], booked_from: date_from, booked_until: date_until)

  redirect to "/property/details/#{params[:id]}"
end

get '/book/edit/:id' do
  @user = User.find(session[:id])
  @property = Property.find(params[:id])
  @booking = Booking.find_by(user_id: session[:id], property_id: params[:id])


  erb :editbook
end

post '/book/edit/:id' do 

  @booking = Booking.find_by(user_id: session[:id], property_id: params[:id])
  date_from = params[:startdate]
  date_until = params[:enddate]

  @booking.update(booked_from: date_from, booked_until: date_until)

  redirect to "/property/details/#{params[:id]}"
end

get '/book/cancel/:id' do 
  
  @booking = Booking.find_by(user_id: session[:id], property_id: params[:id])
  @booking.destroy

  redirect to "/property/details/#{params[:id]}"
end

get '/book/list' do 

  @user = User.find(session[:id])
  @booking = @user.bookings
  erb :listbooking
end