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
    lazy_load_association(:players) do |name: nil, order: nil, asc: true, limit: nil, page: 1|
      scope = Player.all
      scope = scope.where(name: name) if name
      scope = scope.order(order => asc ? 'asc' : 'desc') if order
      scope = scope.limit(limit) if limit
      scope = scope.offset((page - 1) * limit) if limit && page > 1
      # return ActiveRecordRelation scope
      scope
    end

    field :players_custom, [Types::PlayerType], null: false do
      argument :name, String, required: false
      argument :order, String, required: false
      argument :asc, Boolean, required: false
      argument :limit, Integer, required: false
      argument :page, Integer, required: false
    end
    # default_value: [] is needed so that if a team doesnt have any players an empty array is still returned
    lazy_load_custom(:players_custom, :id, default_value: []) do |team_ids, name: nil, order: nil, asc: true, limit: nil, page: 1|
      query = Player.where(team_id: team_ids)
      query = query.where(name: name) if name
      query = query.order(order => asc ? 'asc' : 'desc') if order
      query = query.limit(limit) if limit
      query = query.offset((page - 1) * limit) if limit && page > 1
      # return hash of team_id => [player_on_team,...], ...
      query.group_by(&:team_id)
    end
  end
end
