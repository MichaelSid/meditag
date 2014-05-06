class RegistrationController < Devise::RegistrationsController

  def assign_uuid_to_current_user
    if current_user
      authenticate_user!
      save_uuid
    else
      flash[:notice] = 'You must be logged in to complete this action'
    end
  end
  
  protected

  def after_sign_up_path_for(resource)
    super 
    new_profile_path
  end
  
end