class SessionsController < ApplicationController
	def callback
		auth = request.env['omniauth.auth']
		session[:userid] = auth[:uid]
		session[:username] = auth[:info][:nickname]
		redirect_to root_path, notice: 'ログインしました'
	end

	def destroy
		reset_session
		redirect_to root_path, notice: 'ログアウトしました'
	end

end
