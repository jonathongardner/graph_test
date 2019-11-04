module Types
  class PlayerType < Types::BaseObject
    required_permission :anyone

    field :id, ID, null: false

    field :name, String, null: false, required_permission: :anyone
    field :special_name, String, null: false
    def special_name
      object.name
    end
    field :super_special_name, String, null: false, required_permission: :admin
    def super_special_name
      object.name
    end

    field :position, Types::PositionType, null: false
    lazy_load_association(:position)

    field :position_custom, Types::PositionType, null: false
    lazy_load_custom(:position_custom, :position_id) do |position_ids|
      # return hash of position_id => position, ...
      Position.where(id: position_ids).each_with_object({}) do |position, acc|
        acc[position.id] = position
      end
    end

    field :team, Types::TeamType, null: false
    lazy_load_association(:team)

    field :team_custom, Types::TeamType, null: false
    lazy_load_custom(:team_custom, :team_id) do |team_ids|
      # return hash of team_id => team, ...
      Team.where(id: team_ids).each_with_object({}) do |team, acc|
        acc[team.id] = team
      end
    end
  end
end
