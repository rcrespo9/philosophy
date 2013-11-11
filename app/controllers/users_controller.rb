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

	def format_me(mongoid_objects)
		mongoid_objects.each do |object|
			object.value.to_i 
		end
	end

	def get_total(mongoid_objects)
		sum = 0
		mongoid_objects.each do |object|
			sum += object.value.to_i
		end
		sum
	end

	def transmit
		@males = User.where(gender: "Male")

		@males_under21 = User.where(gender: "Male").in(age: "under 21")

		@males_under21_formatted = format_me(@males_under21)

		@males_under21_total = get_total(@males_under21)
		@males_under21_avg = @males_under21_total / @males_under21.count
	end

		# @males_under21_formatted.each do |male_under21|
		# 	male_under21.value
		# end

		# @sum = 0
		# @males_under21_formatted.each do |male|
		# 	@sum = @sum + male
		# end

		# sum = 0
		# @males_under21_total_value = @males_under21_formatted.each do |male|
		# 	sum += male.value
		# 	return sum
		# end
		
		# @males_under21_avg_value = sum / males_under21_formatted.count







		@males21_to_25 = User.where(gender: "Male").in(age: "21-25")

		@males26_to_30 = User.where(gender: "Male").in(age: "26-30")

		@males31_to_35 = User.where(gender: "Male").in(age: "31-35")

		@males36_to_40 = User.where(gender: "Male").in(age: "36-40")

		@males41_to_45 = User.where(gender: "Male").in(age: "41-45")

		@males46_to_50 = User.where(gender: "Male").in(age: "46-50")

		@males51_to_55 = User.where(gender: "Male").in(age: "51-55")

		@males56_to_60 = User.where(gender: "Male").in(age: "56-60")

		@males61_to_65 = User.where(gender: "Male").in(age: "61-65")

		@males_over65 = User.where(gender: "Male").in(age: "+65")
		
		# @test_data_avg = (@test_data.reduce(:+) / @test_data.count).to_i




# <hr>
# <h3><%= @males21_to_25 %></h3>
# <hr>
# <h3><%= @males26_to_30 %></h3>
# <hr>
# <h3><%= @males31_to_35 %></h3>
# <hr>
# <h3><%= @males36_to_40 %></h3>
# <hr>
# <h3><%= @males41_to_45 %></h3>
# <hr>
# <h3><%= @males46_to_50 %></h3>
# <hr>
# <h3><%= @males51_to_55 %></h3>
# <hr>
# <h3><%= @males56_to_60 %></h3>
# <hr>
# <h3><%= @males61_to_65 %></h3>
# <hr>
# <h3><%= @males_over65 %></h3>



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