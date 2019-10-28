# frozen_string_literal: true

class Filter < Slots::JWT::PermissionFilter
  def allowed?
    return true if required_permission == :anyone
    # loaded user gets it from the DB to help ensure user info is current
    return valid_loaded_user if required_permission == :loaded_user
    # since admin is special need to always load from db
    return is_admin if required_permission == :admin
    # default to a valid user
    current_user.present?
  end

  def is_admin
    valid_loaded_user && current_user.admin
  end
end
