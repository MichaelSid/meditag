class IdverifiesController < ApplicationController

include IdverifiesHelper

  def new
    check_tag_association unless current_user.nil?
  end

  def check_tag_association
    if current_user.uuid.blank?
        flash.now[:notice] = "No tag associated with this account"
      else
        flash.now[:notice] = "Account already has a tag associated. Click the 'Register Tag' link to set new"
    end
  end

  def verify
    @uuid = params["tag-uuid"].to_s
    verification_functions
  end

  def verification_functions
    if valid_uuid?
      flash.now[:notice] = 'UUID verified successfully'
      save_uuid_to_current_user
    else
      flash[:notice] = 'Something went wrong. Please try again'
    end
  end

  def save_uuid_to_current_user
    if user_signed_in?
      current_user.uuid = @uuid
      current_user.save
      redirect_to edit_profile_path
    else
      session[:uuid] = @uuid
      redirect_to new_user_registration_path
    end
  end

end
