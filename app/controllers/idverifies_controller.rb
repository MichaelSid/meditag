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
      save_uuid_to_current_user
    else
      flash[:notice] = 'Something went wrong. Please try again'
    end
  end

  def save_uuid_to_current_user
    if user_signed_in?# && current_user.uuid.blank?
      current_user.uuid = @uuid
      current_user.save
      redirect_to edit_profile_path
    else
      session[:uuid] = @uuid
      redirect_to new_user_registration_path
    end
  end

end
