class IdverifiesController < ApplicationController

  def new
    # @uuid = params['tag-uuid'].to_s\
    # verify_uuid?
    # uuid_assigned_to_user?
  end

   def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(params[:user].permit(:uuid))
      flash[:notice] = 'user updated successfully'
      redirect_to "/user/edit"
    else
      render 'update'
    end
  end

  private

  def verify
    @uuid = params["tag-uuid"].to_s
    verification_functions
  end

  def verification_functions
    combined_check
    if combined_check
      flash[:notice] = 'UUID verified successfully'
    else
      flash[:notice] = 'Something went wrong. Please try again'
    end
  end

  def combined_check
    verify_uuid_length?
    uuid_assigned_to_user?
  end

  def verify_uuid_length?
    @uuid.length == 36 #? flash[:notice] = 'Correct length' : flash[:error] = 'Incorrect length'
  end

  def uuid_assigned_to_user?
    User.exists?(uuid: @uuid) #? flash[:error] = 'ID already assigned to user' : flash[:notice] = 'ID not assigned to user'
  end

end
