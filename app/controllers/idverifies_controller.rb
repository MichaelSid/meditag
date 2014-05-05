class IdverifiesController < ApplicationController

  def new
    
  end

  def verify
    @uuid = params["tag-uuid"].to_s
    verification_functions
  end

  def verification_functions
    if combined_verification_check
      flash[:notice] = 'UUID verified successfully'
    else
      flash[:notice] = 'Something went wrong. Please try again'
    end
  end

  def combined_verification_check
    return false unless verify_uuid_length?
    return false unless uuid_assigned_to_user?
  end

  def verify_uuid_length?
    @uuid.length == 36
  end

  def uuid_assigned_to_user?
    User.exists?(uuid: @uuid)
  end

end
