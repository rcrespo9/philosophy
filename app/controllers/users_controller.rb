class UsersController < ApplicationController
	def home
	end

	def receiver

		remote_address = request.env["REMOTE_ADDR"]
		remote_host = request.env["REMOTE_HOST"]
		server_name = request.env["SERVER_NAME"]
		server_port = request.env["SERVER_PORT"]
		http_host = request.env["HTTP_HOST"]
		http_user_agent = request.env["HTTP_USER_AGENT"]
		http_accept_language = request.env["HTTP_ACCEPT_LANGUAGE"]

		new_user = User.new(user_params)
		new_user.update_attributes(remote_addr: remote_address, remote_host: remote_host, server_name: server_name, server_port: server_port, http_host: http_host, http_user_agent: http_user_agent, http_accept_language: http_accept_language)
		respond_to do |format|
			format.json {render :json => params[:user].to_json}
		end
	end

	def transmit
		males_array = []
		females_array = []

		# DB inquiries for selected male ranges & obtain avg values
		males_under21 = User.where(gender: "Male", age: "under 21")
		males_array.push(avg_me(get_total(males_under21), males_under21.count))

		males21_to_25 = User.where(gender: "Male", age: "21-25")
		males_array.push(avg_me(get_total(males21_to_25), males21_to_25.count))

		males26_to_30 = User.where(gender: "Male", age: "26-30")
		males_array.push(avg_me(get_total(males26_to_30), males26_to_30.count))

		males31_to_35 = User.where(gender: "Male", age: "31-35")
		males_array.push(avg_me(get_total(males31_to_35), males31_to_35.count))

		males36_to_40 = User.where(gender: "Male", age: "36-40")
		males_array.push(avg_me(get_total(males36_to_40), males36_to_40.count))

		males41_to_45 = User.where(gender: "Male", age: "41-45")
		males_array.push(avg_me(get_total(males41_to_45), males41_to_45.count))

		males46_to_50 = User.where(gender: "Male", age: "46-50")
		males_array.push(avg_me(get_total(males46_to_50), males46_to_50.count))

		males51_to_55 = User.where(gender: "Male", age: "51-55")
		males_array.push(avg_me(get_total(males51_to_55), males51_to_55.count))

		males56_to_60 = User.where(gender: "Male", age: "56-60")
		males_array.push(avg_me(get_total(males51_to_55), males56_to_60.count))

		males61_to_65 = User.where(gender: "Male", age: "61-65")
		males_array.push(avg_me(get_total(males61_to_65), males61_to_65.count))

		males_over65 = User.where(gender: "Male", age: "+65")
		males_array.push(avg_me(get_total(males_over65), males_over65.count))

		# DB inquiries for selected female ranges & obtain avg values
		females_under21 = User.where(gender: "Female", age: "under 21")
		females_array.push(avg_me(get_total(females_under21), females_under21.count))

		females21_to_25 = User.where(gender: "Female", age: "21-25")
		females_array.push(avg_me(get_total(females21_to_25), females21_to_25.count))

		females26_to_30 = User.where(gender: "Female", age: "26-30")
		females_array.push(avg_me(get_total(females26_to_30), females26_to_30.count))

		females31_to_35 = User.where(gender: "Female", age: "31-35")
		females_array.push(avg_me(get_total(females31_to_35), females31_to_35.count))

		females36_to_40 = User.where(gender: "Female", age: "36-40")
		females_array.push(avg_me(get_total(females36_to_40), females36_to_40.count))

		females41_to_45 = User.where(gender: "Female", age: "41-45")
		females_array.push(avg_me(get_total(females41_to_45), females41_to_45.count))

		females46_to_50 = User.where(gender: "Female", age: "46-50")
		females_array.push(avg_me(get_total(females46_to_50), females46_to_50.count))

		females51_to_55 = User.where(gender: "Female", age: "51-55")
		females_array.push(avg_me(get_total(females51_to_55), females51_to_55.count))

		females56_to_60 = User.where(gender: "Female", age: "56-60")
		females_array.push(avg_me(get_total(females51_to_55), females56_to_60.count))

		females61_to_65 = User.where(gender: "Female", age: "61-65")
		females_array.push(avg_me(get_total(females61_to_65), females61_to_65.count))

		females_over65 = User.where(gender: "Female", age: "+65")
		females_array.push(avg_me(get_total(females_over65), females_over65.count))

		payload = {
			male_data: males_array,
			female_data: females_array
		}

		respond_to do |format|
			format.html
			format.json {render :json => payload.to_json}
		end
	end

	def test_index
		@users = User.all
	end

###################################################
	## Helper methods...

	# Returns sum of queries as integer
	def get_total(mongoid_objects)
		sum = 0
		mongoid_objects.each do |object|
			sum += object.value.to_i
		end
		sum
	end

	# Rescues for zero division error, returns avg.
	def avg_me(total, count)
		return total / count
	rescue
		0
	end
###################################################
	def chart
	end

	def testing
		# @males_under21 = User.where(gender: "Male", age: "under 21")
		# @males_under21_total = get_total(@males_under21)
		# @males_under21_count = @males_under21.count || 0
		# @males_under21_avg = avg_me(@males_under21_total, @males_under21_count)	

		# @males21_to_25 = User.where(gender: "Male", age: "21-25")
		# @males21_to_25_total = get_total(@males21_to_25)
		# @males21_to_25_count = @males21_to_25.count || 0
		# @males21_to_25_avg = avg_me(@males21_to_25_total, @males21_to_25_count)

		@males26_to_30 = User.where(gender: "Male", age: "26-30")
		@males26_to_30_count = @males26_to_30.count || 0
		@males26_to_30_total = get_total(@males26_to_30)
		@males26_to_30_avg = avg_me(@males26_to_30_total, @males26_to_30_count)
	end


	private
	def user_params
		params.require(:user).permit(:gender, :value, :age)
	end

end