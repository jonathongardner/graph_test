module Types
  class PositionType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: false

    field :players, [Types::PlayerType], null: false
    lazy_load_association(:players)

    field :players_custom, [Types::PlayerType], null: false
    # default_value: [] is needed so that if a team doesnt have any players an empty array is still returned
    lazy_load_custom(:players_custom, :id, default_value: []) do |player_ids|
      query = Player.where(id: player_ids)
      # return hash of player_id => [player_in_position,...], ...
      query.group_by(&:id)
    end
  end
end
