class RegistrationController < Devise::RegistrationsController
  
  protected

  def after_sign_up_path_for(resource)
    super 
    new_profile_path
  end
  
end