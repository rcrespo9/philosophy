class UsersController < ApplicationController
	def home
	end

	def receiver
		new_user = User.new(user_params)
		new_user.save

		respond_to do |format|
			format.json {render :json => params[:user].to_json}
		end
	end

	def test_index
		# request1 = request.env['HTTP_X_FORWARDED_FOR']
		# binding.pry
		@users = User.all
	end

	private
	def user_params
		params.require(:user).permit(:gender, :value, :age)
	end

end