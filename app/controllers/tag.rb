get '/tag/:tag_name' do
		@user = User.find(session[:id])
		@tagged = Tag.find_by(tag: params[:tag_name])

		erb :tag
end