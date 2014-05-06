class IdverifiesController < ApplicationController

  def new
    # @uuid = params['tag-uuid'].to_s
    # verify_uuid?
    # uuid_assigned_to_user?
  end

  def verify
    @uuid = params["tag-uuid"].to_s
    verification_functions
  end

  def verification_functions
    verify_uuid_length?
    uuid_assigned_to_user?
  end

  def verify_uuid_length?
    @uuid.length == 36 ? flash[:notice] = 'Correct length' : flash[:error] = 'Incorrect length'
  end

  def uuid_assigned_to_user?
    User.exists?(uuid: @uuid) ? flash[:error] = 'ID already assigned to user' : flash[:notice] = 'ID not assigned to user'
  end

  def uuid_is_nil?
    if @uuid == nil
      redirect_to '/idverify/new'
      flash[:error] = 'Value cannot be nil'
    end
  end

end