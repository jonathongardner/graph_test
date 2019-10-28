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

    field :position, Types::PositionType, null: false, required_permission: :anyone
    field :team, Types::TeamType, null: false, required_permission: :anyone

    def team
      object.team
    end
  end
end
