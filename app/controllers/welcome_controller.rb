class WelcomeController < ApplicationController
	
	before_filter :logged_in, only: [:index]

	private
	    def logged_in
	      if user_signed_in?
	        redirect_to feeds_path
		end
	end
	
end
