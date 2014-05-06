class IdverifiesController < ApplicationController

include IdverifiesHelper

  def new
    
  end

  def verify
    @uuid = params["tag-uuid"].to_s
    verification_functions
  end

  def verification_functions
    if valid_uuid?
      flash[:notice] = 'UUID verified successfully'
      session[:uuid] = @uuid
      uuid_verified_redirect
    else
      flash[:notice] = 'Something went wrong. Please try again'
    end
  end

  def uuid_verified_redirect
    if user_signed_in?
      authenticate_user!
    else
      redirect_to new_user_registration_path
    end
  end

end
