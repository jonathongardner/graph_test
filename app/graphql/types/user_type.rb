# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true, required_permission: :anyone

    field :username, String, null: true, required_permission: :anyone
    field :admin, Boolean, null: true
  end
end
