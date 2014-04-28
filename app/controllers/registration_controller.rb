class RegistrationController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    super 
    profile_new_path
  end
end
