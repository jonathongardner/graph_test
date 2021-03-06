module Types
  class SuperSpecialPlayerType < Types::BaseObject
    required_permission :admin

    field :id, ID, null: false
    field :name, String, null: false

    field :position, Types::PositionType, null: false
    field :team, Types::TeamType, null: false

    def team
      object.team
    end
  end
end
