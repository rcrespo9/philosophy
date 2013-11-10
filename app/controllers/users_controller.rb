class UsersController < ApplicationController
	def home
		@user = User.new(params[:days])
	end

	def create
		@user = User.create
	end

	def sample
	end

	def feeder
		respond_to do |format|
			format.json {render :json => :data}
		end
	end
end
