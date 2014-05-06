class HomeController < ApplicationController
  def index
  	if current_user
  		redirect_to '/profile/edit'
  	else
	  	render layout: false
	end
  end
end
