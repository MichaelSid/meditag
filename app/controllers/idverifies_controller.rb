class IdverifiesController < ApplicationController

  def new
    @uuid = params['tag-uuid']
    uuid_assigned_to_user?
  end

  def uuid_assigned_to_user?
    if User.exists?(uuid: @uuid)
      flash[:notice] = 'ID already assigned to user'
    else
      flash[:notice] = 'ID not assigned to user'
    end
  end

end
