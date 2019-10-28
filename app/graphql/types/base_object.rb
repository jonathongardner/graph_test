module Types
  class BaseObject < GraphQL::Schema::Object
    extend Slots::JWT::TypeHelper

    field_class AuthorizedField
  end
end
