class RequestsController < ApplicationController

	# GET /
	def index
		@requests = Request.all
		render "index"
	end

	# GET /requests/new
	def new
		@request = Request.new
	end

	# POST /requests
	def create
		@request = Request.new(permitted_params)
		if @request.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private
	def permitted_params
		params.require(:request).permit(:title, :userid, :username, :state, :favor_num)
	end
end
