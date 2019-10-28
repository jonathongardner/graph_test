class Types::AuthorizedField < GraphQL::Schema::Field
  include Slots::JWT::TypeHelper
end
