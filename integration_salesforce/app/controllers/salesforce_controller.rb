class SalesforceController < ApplicationController
  	def callback
	  credentials = env["omniauth.auth"]["credentials"]
	  session['token'] = credentials["token"]
	  session['refresh_token'] = credentials["refresh_token"]
	  session['instance_url'] = credentials["instance_url"]
	  redirect_to '/users/'+ session[:user].to_s + '?message=salesforceok'
	end 

	def failure
	  flash[:error] = 'Authorization failure'
	  redirect_to  '/users/' + session[:user].to_s + '?message=salesforcefail'
	end

end
