module Types
  class TeamType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :players, [Types::PlayerType], null: false do
      argument :name, String, required: false
      argument :order, String, required: false
      argument :asc, Boolean, required: false
      argument :limit, Integer, required: false
      argument :page, Integer, required: false
    end

    def players(name: nil, order: nil, asc: true, limit: nil, page: 1)
      scope = Player.all
      scope = scope.where(name: name) if name
      scope = scope.order(order => asc ? 'asc' : 'desc') if order
      scope = scope.limit(limit) if limit
      scope = scope.offset((page - 1) * limit) if limit && page > 1
      GraphqlLazyLoad::ActiveRecordRelation.new(self, :players, scope: scope)
    end
  end
end
