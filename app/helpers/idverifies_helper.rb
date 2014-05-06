module IdverifiesHelper
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
