class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect_to root_path, notice: 'Logged in!'
		else
			flash.now.alert = 'Invalid login credentials - try again!'
			render :new
		end
	end

	def destroy
		name = current_user.name
		session[:user_id] = nil
		redirect_to root_path, notice: "Logged out! - Come back again #{name}!"
	end
end