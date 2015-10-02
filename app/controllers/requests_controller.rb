class RequestsController < ApplicationController

	# GET /
	def index
		@requests = Request.all
		render "index"
	end

	# GET /requests/new
	def new
		redirect_to root_path, alert:"ログインしていなければ投稿できません" if session[:username].nil?
		@request = Request.new
	end

	# POST /requests
	def create
		@request = Request.new(permitted_params)
		@request.favor_num = 1
		if @request.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	# POST /requests/vote/:id
	def vote
		@request = Request.find(params[:id])
		if @request.increment!(:favor_num)
			redirect_to root_path, notice:"賛成に投票しました"
		else
			redirect_to root_path, alert:"投票に失敗しました"
		end
	end
	private
	def permitted_params
		params.require(:request).permit(:title, :userid, :username, :state, :favor_num)
	end
end
