# frozen_string_literal: true

class GraphTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
