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
		@request.favor_list = session[:userid]
		if @request.save
			redirect_to root_path, notice:"投稿に成功しました"
		else
			render 'new'
		end
	end

	# POST /requests/vote/:id
	def vote
		@request = Request.find(params[:id])
		favor_list = @request.favor_list.split(',')
		if favor_list.include?(session[:userid])
			redirect_to root_path, alert:"すでに投票済みです。"
		else
			if @request.increment!(:favor_num) && @request.update(favor_list: @request.favor_list+",#{session[:userid]}")
				redirect_to root_path, notice:"賛成に投票しました"
			else
				redirect_to root_path, alert:"投票に失敗しました"
			end
		end
	end
	private
	def permitted_params
		params.require(:request).permit(:title, :userid, :username, :state, :favor_num, :favor_list)
	end
end
