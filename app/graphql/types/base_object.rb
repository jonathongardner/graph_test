module Types
  class BaseObject < GraphQL::Schema::Object
    extend GraphqlLazyLoad::ObjectHelper
    extend Slots::JWT::TypeHelper

    field_class AuthorizedField
  end
end
