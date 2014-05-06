class IdverifiesController < ApplicationController

  def new
    
  end

  def verify
    @uuid = params["tag-uuid"].to_s
    verification_functions
  end

  def verification_functions
    if valid_uuid?
      flash[:notice] = 'UUID verified successfully'
    else
      flash[:notice] = 'Something went wrong. Please try again'
    end
  end

  def valid_uuid?
    return false unless correct_uuid_length?
    return false if uuid_assigned_to_user?
    return true
  end

  def correct_uuid_length?
    @uuid.length == 36
  end

  def uuid_assigned_to_user?
    User.exists?(uuid: @uuid)
  end

end
