class UsersController < ApplicationController
	def home
	end

	def receiver
		# Establish environmental variables.
		remote_address = request.env["REMOTE_ADDR"]
		remote_host = request.env["REMOTE_HOST"]
		http_host = request.env["HTTP_HOST"]
		http_user_agent = request.env["HTTP_USER_AGENT"]
		http_accept_language = request.env["HTTP_ACCEPT_LANGUAGE"]


		# Create new user instance with user_params from ajax request.
		new_user = User.new(user_params)


		# Assign environmental variables to the new user instance.
		new_user.remote_addr = remote_address
		new_user.remote_host = remote_host
		new_user.http_host = http_host
		new_user.http_user_agent = http_user_agent
		new_user.http_accept_language = http_accept_language


		# Perform cookie check, if cookie exists, flag the user instance.
		if cookies['voted_on']
			new_user.flagged = true
		else
			cookies['voted_on'] = {
			  :value => Time.now,
			  :expires => 7.days.from_now
			}
			new_user.flagged = false
		end


		# Save new user instance into the DB.
		new_user.save

		
		# Responds to json request and captures form user_params.
		respond_to do |format|
			format.json {render :json => params[:user].to_json}
		end
	end

	def transmit
		# Establish male and female arrays
		males_array = []
		females_array = []


		# DB queries for each selected male range, flagged false. Append the average values into males_array.
		males_under21 = User.where(gender: "Male", age: "under 21", flagged: false)
		males_array.push(avg_me(get_total(males_under21), males_under21.count))

		males21_to_25 = User.where(gender: "Male", age: "21-25", flagged: false)
		males_array.push(avg_me(get_total(males21_to_25), males21_to_25.count))

		males26_to_30 = User.where(gender: "Male", age: "26-30", flagged: false)
		males_array.push(avg_me(get_total(males26_to_30), males26_to_30.count))

		males31_to_35 = User.where(gender: "Male", age: "31-35", flagged: false)
		males_array.push(avg_me(get_total(males31_to_35), males31_to_35.count))

		males36_to_40 = User.where(gender: "Male", age: "36-40", flagged: false)
		males_array.push(avg_me(get_total(males36_to_40), males36_to_40.count))

		males41_to_45 = User.where(gender: "Male", age: "41-45", flagged: false)
		males_array.push(avg_me(get_total(males41_to_45), males41_to_45.count))

		males46_to_50 = User.where(gender: "Male", age: "46-50", flagged: false)
		males_array.push(avg_me(get_total(males46_to_50), males46_to_50.count))

		males51_to_55 = User.where(gender: "Male", age: "51-55", flagged: false)
		males_array.push(avg_me(get_total(males51_to_55), males51_to_55.count))

		males56_to_60 = User.where(gender: "Male", age: "56-60", flagged: false)
		males_array.push(avg_me(get_total(males51_to_55), males56_to_60.count))

		males61_to_65 = User.where(gender: "Male", age: "61-65", flagged: false)
		males_array.push(avg_me(get_total(males61_to_65), males61_to_65.count))

		males_over65 = User.where(gender: "Male", age: "+65", flagged: false)
		males_array.push(avg_me(get_total(males_over65), males_over65.count))


		# DB queries for each selected female range, flagged false. Append the average values into females_array.
		females_under21 = User.where(gender: "Female", age: "under 21", flagged: false)
		females_array.push(avg_me(get_total(females_under21), females_under21.count))

		females21_to_25 = User.where(gender: "Female", age: "21-25", flagged: false)
		females_array.push(avg_me(get_total(females21_to_25), females21_to_25.count))

		females26_to_30 = User.where(gender: "Female", age: "26-30", flagged: false)
		females_array.push(avg_me(get_total(females26_to_30), females26_to_30.count))

		females31_to_35 = User.where(gender: "Female", age: "31-35", flagged: false)
		females_array.push(avg_me(get_total(females31_to_35), females31_to_35.count))

		females36_to_40 = User.where(gender: "Female", age: "36-40", flagged: false)
		females_array.push(avg_me(get_total(females36_to_40), females36_to_40.count))

		females41_to_45 = User.where(gender: "Female", age: "41-45", flagged: false)
		females_array.push(avg_me(get_total(females41_to_45), females41_to_45.count))

		females46_to_50 = User.where(gender: "Female", age: "46-50", flagged: false)
		females_array.push(avg_me(get_total(females46_to_50), females46_to_50.count))

		females51_to_55 = User.where(gender: "Female", age: "51-55", flagged: false)
		females_array.push(avg_me(get_total(females51_to_55), females51_to_55.count))

		females56_to_60 = User.where(gender: "Female", age: "56-60", flagged: false)
		females_array.push(avg_me(get_total(females51_to_55), females56_to_60.count))

		females61_to_65 = User.where(gender: "Female", age: "61-65", flagged: false)
		females_array.push(avg_me(get_total(females61_to_65), females61_to_65.count))

		females_over65 = User.where(gender: "Female", age: "+65", flagged: false)
		females_array.push(avg_me(get_total(females_over65), females_over65.count))


		# Assign males_array and females_array as key: value pairs to the payload hash.
		payload = {
			male_data: males_array,
			female_data: females_array
		}


		# Responds to json request and posts payload.
		respond_to do |format|
			format.html
			format.json {render :json => payload.to_json}
		end
	end

	def chart
	end

###################################################
	## Helper methods called within transmit action

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

	# Establish strong params for the user data collected.
	private
	def user_params
		params.require(:user).permit(:gender, :value, :age)
	end

end