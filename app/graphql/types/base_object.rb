module Types
  class BaseObject < GraphQL::Schema::Object
    extend GraphqlLazyLoad::ObjectHelper
  end
end
