class UsersController < ApplicationController
	def home
		@user = User.new(params[:days])
	end

	def create
		@user = User.create
	end

	def sample
	end
end
