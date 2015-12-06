class SessionsController < ApplicationController
	before_filter :authenticate, :except=>[:new, :create]
	
  def new
  	
  end

  def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
		  session[:user_id] = user.id 
		  redirect_to users_path
	  end
	  if session[:user_id].nil?
	  	flash[:notice] = 'Email or password failed.'
	  	# to set the first user, comment out the line below and go to http://localhost:3000/users/new, then uncomment it again and you are good to go.
	  	redirect_to login_path
	  end
  end

  def destroy
	  session[:user_id] = nil 
	  redirect_to root_url, notice: 'Logged out.'
  end
end
