class UsersController < ApplicationController
	def home
		@user = User.new(params[:user])
	end

	def create
		@user = User.create
	end
end
