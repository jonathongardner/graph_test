# frozen_string_literal: true

class GraphTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  lazy_resolve(GraphqlLazyLoad::Custom, :result)
  lazy_resolve(GraphqlLazyLoad::ActiveRecordRelation, :result)
end
