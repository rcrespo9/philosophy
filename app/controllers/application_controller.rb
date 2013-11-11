class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :cookie_checker

  # def cookie_checker
  # 	if cookie exists
  # 		direct to results
  # 	else
  # 		cookie doesnt exist create cookie
  # 		display vote page
  # 		(make exception for before_filter for the results url)
  # 	end
  # end
end
